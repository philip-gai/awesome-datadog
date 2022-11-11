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
  $isValid = Test-Monitor -MonitorFile $monitorFile.FullName -ApiKey $ApiKey -AppKey $AppKey -Debug:$DebugPreference -Verbose:$VerbosePreference
  if (!$isValid) {
    Write-Warning "Monitor `"$($monitorFile.FullName)`" is invalid"
    $invalidMonitors += $monitorFile.FullName
  }
}

$validMonitorCount = $monitorFiles.Count - $invalidMonitors.Count
Write-Host "$validMonitorCount/$($monitorFiles.Count) monitors are valid"

if ($invalidMonitors.Count -gt 0) {
  Write-Warning "Invalid monitors:`n$($invalidMonitors | Out-String)"
  exit 1
}
