#############################################
# 3. Install and Configure VS Code
# by Josh Cooper
#############################################

Write-Host "Installing and Configuring VS Code..." -ForegroundColor Black -BackgroundColor Yellow

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

$LogFolder = "C:\Temp\SetupScripts\VSCode"
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

Function InstallVSCode {
    choco install vscode -y
}

Function InstallVSCodeExt {
    $extensions =
    "akamud.vscode-theme-onedark",
    "ms-dotnettools.csharp",
    "streetsidesoftware.code-spell-checker",
    "ms-azuretools.vscode-docker",
    "eamodio.gitlens",
    "techer.open-in-browser",
    "esbenp.prettier-vscode",
    "ms-python.python",
    "ms-vscode-remote.remote-wsl",
    "vscode-icons-team.vscode-icons",
    "coenraads.bracket-pair-colorizer"

    $cmd = "code --list-extensions"
    Invoke-Expression $cmd -OutVariable output | Out-Null
    $installed = $output -split "\s"

    foreach ($ext in $extensions) {
        if ($installed.Contains($ext)) {
            Write-Host $ext "already installed." -ForegroundColor Gray
        }
        else {
            Write-Host "Installing" $ext "..." -ForegroundColor White
            code --install-extension $ext
        }
    }
}

function SettingsDotJson {
    $folderPath = "C:\setup-windows10"
    $inFile = "$folderPath\VSCode\settings.json"
    $outFile = "$env:APPDATA\Code\User\settings.json"
    Write-Host "Copying from $inFile to $outFile"
    Copy-Item -Path $inFile -Destination $outFile
}

Write-Host "Installing VS Code..." -BackgroundColor Magenta -ForegroundColor White
InstallVSCode
Start-Sleep 1

Write-Host "Installing VS Code Extensions..." -BackgroundColor Magenta -ForegroundColor White
InstallVSCodeExt
Start-Sleep 1

Write-Host "Implement Custom Settings..." -BackgroundColor Magenta -ForegroundColor White
SettingsDotJson
Start-Sleep 1