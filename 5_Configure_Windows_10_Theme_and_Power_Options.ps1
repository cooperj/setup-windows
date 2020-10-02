#############################################
# 4. Configure Windows 10 Theme and Power Options
# by Josh Cooper
#############################################

Write-Host "Configuring Windows 10 Theming..." -ForegroundColor Black -BackgroundColor Yellow

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

$LogFolder = "C:\Temp\SetupScripts\Theme"
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

Function SetColourTheme {
    Write-Output "Setting the Windows Colour Theme"
    $path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    If (!(Test-Path $path)) {
        New-Item $path 
    }
    Set-ItemProperty $path AppsUseLightTheme -Value 1
    Set-ItemProperty $path SystemUsesLightTheme -Value 0 
}

Function DisableACSleep {
    Write-Host "Disable Sleep on AC Power..." -ForegroundColor Green
    Powercfg /Change monitor-timeout-ac 20
    Powercfg /Change standby-timeout-ac 0
}

Write-Host "Updating Windows Colour Theme..." -BackgroundColor Magenta -ForegroundColor White
SetColourTheme
Start-Sleep 1

Write-Host "Setting Power Options..." -BackgroundColor Magenta -ForegroundColor White
DisableACSleep
Start-Sleep 1