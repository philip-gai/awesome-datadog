# Import all the functions
$functionsFolder = Join-Path $PSScriptRoot "functions"
. $functionsFolder/Search-Monitor.ps1
. $functionsFolder/New-Monitor.ps1
. $functionsFolder/Test-Monitor.ps1
. $functionsFolder/Update-Monitor.ps1
