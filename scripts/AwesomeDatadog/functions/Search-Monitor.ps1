function Search-Monitor {
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
  $monitorName = $monitor.name
  $monitorNameSanitized = $monitorName -replace "[^a-zA-Z0-9 ._]", ""
  $query = @{
    query = $monitorNameSanitized
  }

  Write-Debug "Monitor: $monitorNameSanitized"
  Write-Debug "Query: $($query | Out-String)"
  Write-Host "Searching for monitor `"$monitorName`""

  $monitorSearchResult = Invoke-WebRequest `
      -Uri " https://api.datadoghq.com/api/v1/monitor/search" `
      -Method Get `
      -UseBasicParsing `
      -Headers @{"DD-API-KEY" = $ApiKey; "DD-APPLICATION-KEY" = $AppKey } `
      -Body $query `
      | ConvertFrom-Json

  Write-Debug "Monitor search results: $($monitorSearchResult | ConvertTo-Json)"

  if ($monitorSearchResult.monitors.Count -ne 1) {
    Write-Host "Monitor not found: $monitorNameSanitized"
    return $null
  }

  $monitorId = $monitorSearchResult.monitors[0].id

  return $monitorId
}