#############################################
# 2. Install Chocolatey
# by Josh Cooper
#############################################

Write-Host "Running Windows 10 Debloater Script..." -ForegroundColor Black -BackgroundColor Yellow

Function InstallChoco {
    Write-Host "Installing Chocolate for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Host "Installing Choco..." -BackgroundColor Magenta -ForegroundColor White
InstallChoco
Start-Sleep 1