#############################################
# 2. Install Productivity Applications
# by Josh Cooper
#############################################

Write-Host "Installing Productivity Applications..." -ForegroundColor Black -BackgroundColor Yellow

Function InstallChoco {
    Write-Host "Installing Chocolate for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Function InstallAppsWithChoco {
    Write-Host "Installing Applications..."
    $Apps = @(
        "7zip.install",
        "git",
        "git-lfs",
        "microsoft-edge",
        "googlechrome",,
        "firefox",
        "vlc",
        "dotnetcore-sdk",
        "ffmpeg",
        "wget",
        "openssl.light",
        "vscode",
        "sysinternals",
        "notepadplusplus.install",
        "filezilla",
        "sharex",
        "powertoys",
        "malwarebytes",
        "insomnia-rest-api-client",
        "glasswire",
        "audacity",
        "audacity-lame",
        "handbrake",
        "qbittorrent", 
        "adobereader",
        "discord",
        "putty.install",
        "wireshark",
        "microsoft-windows-terminal",
        "cpu-z.install",
        "gpu-z",
        "coretemp",
        "rufus",
        "sdformatter",
        "virtualbox",
        "obs-studio",
        "arduino",
        "itunes",
        "gimp",
        "blender"
    )
    
    foreach ($app in $Apps) {
        choco install $app -y
    }
}

Write-Host "Installing Choco..." -BackgroundColor Magenta -ForegroundColor White
InstallChoco
Start-Sleep 1

Write-Host "Using Choco Install..." -BackgroundColor Magenta -ForegroundColor White
InstallAppsWithChoco
Start-Sleep 1

Write-Host "Using Choco Install (for pre-release apps)..." -BackgroundColor Magenta -ForegroundColor White
InstallPreReleaseApps
Start-Sleep 1