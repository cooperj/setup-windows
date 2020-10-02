#############################################
# 2. Install Productivity Applications
# by Josh Cooper
#############################################

Write-Host "Installing Productivity Applications..." -ForegroundColor Black -BackgroundColor Yellow

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    $length = 5
    for ($i = 1; $i -le $length; $i++) {
        $j = $length - $i
        Write-Host "Elevating in $j seconds..." -ForegroundColor white -BackgroundColor darkred
        Start-Sleep 1
    }
    Write-Host #ends the line after loop


    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
    exit 
}

#no errors throughout
$ErrorActionPreference = 'silentlycontinue'

$LogFolder = "C:\Temp\SetupScripts\ProdApps"
If (Test-Path $LogFolder) {
    Write-Output "$LogFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$LogFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$LogFolder" -ItemType Directory
    Write-Output "The folder $LogFolder was successfully created."
}

Start-Transcript -OutputDirectory "$LogFolder"

Function InstallAppsWithChoco {
    Write-Host "Installing Applications..."
    $Apps = @(
        "7zip.install",
        "git",
        "git-lfs",
        "microsoft-edge",
        "googlechrome", ,
        "firefox",
        "vlc",
        "dotnetcore-sdk",
        "ffmpeg",
        "wget",
        "openssl.light",
        "sysinternals",
        "notepadplusplus.install",
        "filezilla",
        "winscp.install",
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

Write-Host "Using Choco Install..." -BackgroundColor Magenta -ForegroundColor White
InstallAppsWithChoco
Start-Sleep 1

Write-Host "Using Choco Install (for pre-release apps)..." -BackgroundColor Magenta -ForegroundColor White
InstallPreReleaseApps
Start-Sleep 1
