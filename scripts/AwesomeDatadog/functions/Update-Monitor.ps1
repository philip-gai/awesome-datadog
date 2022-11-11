function Update-Monitor {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$MonitorId,
    [Parameter(Mandatory = $true, Position = 1)]
    [string]$MonitorFile,
    [Parameter(Mandatory = $false)]
    [string]$ApiKey = $env:DD_API_KEY,
    [Parameter(Mandatory = $false)]
    [string]$AppKey = $env:DD_APP_KEY
  )

  $ErrorActionPreference = "Stop"

  # Test file path
  if (-not (Test-Path $MonitorFile)) {
    Write-Error "File not found: $MonitorFile"
    exit 1
  }

  # Import the monitor export file
  $monitor = Get-Content $MonitorFile | ConvertFrom-Json
  $monitorJson = $monitor | ConvertTo-Json

  Write-Debug "Monitor: $monitorJson"
  Write-Host "Updating monitor $MonitorId with $MonitorFile"

  $response = Invoke-WebRequest `
    -Uri "https://api.datadoghq.com/api/v1/monitor/$MonitorId" `
    -ContentType "application/json" `
    -Method Put `
    -UseBasicParsing `
    -Headers @{"DD-API-KEY" = $ApiKey; "DD-APPLICATION-KEY" = $AppKey } `
    -Body $monitorJson `
    | ConvertFrom-Json

  Write-Debug $response
  Write-Host "Monitor updated"
}
