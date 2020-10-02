#############################################
# 5. Configure User Accounts
# by Josh Cooper
#############################################

Write-Host "Configuring User Accounts..." -ForegroundColor Black -BackgroundColor Yellow
Write-Host "Be Prepared to set Login Passwords and Git Properties" -ForegroundColor Black -BackgroundColor Red

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

$LogFolder = "C:\Temp\SetupScripts\ConfigUser"
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

Function UpdateStandardAccount {
    Write-Host "Set a password for normal computer use (on the account $env:UserName)..." -BackgroundColor Green
    net user $env:UserName *
    net localgroup Users $env:UserName /add
    net localgroup Administrators $env:UserName /delete
}

Function UpdateAdminAccount {
    Write-Host "Set a password to use for Administrator Tasks..." -BackgroundColor Cyan -ForegroundColor Black
    net user Administrator /active:yes
    net user Administrator *    
}

Function ConfigureGit {
    Write-Host "Configure Git Commit Options" -BackgroundColor Red -ForegroundColor Yellow
    $name = Read-Host "Name: "
    $email = Read-Host "Email: "

    git config --global user.name = $name
    git config --global user.email = $email
}

Write-Host "Updating Current Account..." -BackgroundColor Magenta -ForegroundColor White
UpdateStandardAccount
Start-Sleep 1

Write-Host "Updating Admin Account..." -BackgroundColor Magenta -ForegroundColor White
UpdateAdminAccount
Start-Sleep 1

Write-Host "Configure Git Settings..." -BackgroundColor Magenta -ForegroundColor White
ConfigureGit
Start-Sleep 1