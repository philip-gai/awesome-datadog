[CmdletBinding()]
param (
  [Parameter(Mandatory = $false)]
  [string]$ApiKey = $env:DD_API_KEY,
  [Parameter(Mandatory = $false)]
  [string]$AppKey = $env:DD_APP_KEY
)

$ErrorActionPreference = "Stop"

Import-Module -Name $PSScriptRoot/AwesomeDatadog/AwesomeDatadog.psm1 -Force

# Get all *.json files in the monitors directories
Write-Host "Getting all monitors from the monitors directories"
$monitorFiles = Get-ChildItem -Path $PSScriptRoot/../*/monitors/*.json -Recurse

Write-Host "Found $($monitorFiles.Count) monitors"
Write-Debug "Monitor files: $monitorFiles"

$invalidMonitors = @()

foreach ($monitorFile in $monitorFiles) {
  # Validate the monitor
  $isValid = Test-Monitor -MonitorFile $monitorFile.FullName -ApiKey $ApiKey -AppKey $AppKey -Debug:$DebugPreference
  if (!$isValid) {
    Write-Warning "Monitor `"$($monitorFile.FullName)`" is invalid"
    $invalidMonitors += $monitorFile.FullName
    continue
  }

  # Try to get the monitor
  $monitorId = Search-Monitor -MonitorFile $monitorFile.FullName -ApiKey $ApiKey -AppKey $AppKey -Debug:$DebugPreference

  if ($monitorId) {
    # If the monitor exists, update it
    Write-Host "Updating monitor $($monitorFile.Name)"
    Update-Monitor -MonitorId $monitorId -MonitorFile $monitorFile.FullName -ApiKey $ApiKey -AppKey $AppKey -Debug:$DebugPreference
  }
  else {
    # If the monitor does not exist, create it
    Write-Host "Creating monitor $($monitorFile.Name)"
    New-Monitor -MonitorFile $monitorFile.FullName -ApiKey $ApiKey -AppKey $AppKey -Debug:$DebugPreference
  }
}

Write-Host "Done publishing monitors 🎉"

if ($invalidMonitors.Count -gt 0) {
  Write-Warning "Invalid monitors:`n$($invalidMonitors | Out-String)"
  exit 1
}
