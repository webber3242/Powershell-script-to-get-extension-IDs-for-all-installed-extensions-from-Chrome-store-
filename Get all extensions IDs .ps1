$chromeUserData = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
$outputFile = ".\extensions.txt"

if (-Not (Test-Path $chromeUserData)) {
    Write-Error "❌ Chrome extensions folder not found at: $chromeUserData"
    exit 1
}

$extIDs = Get-ChildItem -Path $chromeUserData -Directory | Select-Object -ExpandProperty Name

Set-Content -Path $outputFile -Value $extIDs
Write-Host "✅ Saved $(($extIDs).Count) extension IDs to: $outputFile"
