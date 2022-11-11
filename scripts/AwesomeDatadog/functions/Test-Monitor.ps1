function Test-Monitor {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $true, Position = 0)]
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
  $monitor.tags += "managed_by:awesome-datadog"
  $monitorJson = $monitor | ConvertTo-Json -Depth 10

  Write-Debug "Monitor: $monitorJson"
  Write-Host "Validating monitor `"$($monitor.name)`""

  try {
    Invoke-WebRequest `
      -Uri "https://api.datadoghq.com/api/v1/monitor/validate" `
      -ContentType "application/json" `
      -Method Post `
      -UseBasicParsing `
      -Headers @{"DD-API-KEY" = $ApiKey; "DD-APPLICATION-KEY" = $AppKey } `
      -Body $monitorJson
    $isValid = $true
  }
  catch {
    Write-Warning $_.Exception.Message
    $isValid = $false
  }

  if ($isValid) { Write-Verbose "Monitor is Valid" } else { Write-Warning "Monitor is Invalid" }

  return $isValid
}