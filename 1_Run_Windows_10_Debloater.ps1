#############################################
# 1. Run Windows 10 Debloater
# by Josh Cooper
#############################################

Write-Host "Running Windows 10 Debloater Script..." -ForegroundColor Black -BackgroundColor Yellow

# Run External Script from Git Submodule
$scriptPath = "$(PWD)\Windows10Debloater\Windows10Debloater.ps1"
powershell.exe -File $scriptPath