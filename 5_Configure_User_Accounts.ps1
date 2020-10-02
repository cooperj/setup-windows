#############################################
# 5. Configure User Accounts
# by Josh Cooper
#############################################

Write-Host "Configuring User Accounts..." -ForegroundColor Black -BackgroundColor Yellow

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ 
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    $length = 5
    for ($i=1; $i -le $length; $i++)  {
        $j = $length - $i
        Write-Host "Elevating in $j seconds..." -ForegroundColor white -BackgroundColor darkred
        Start-Sleep 1
      }
      Write-Host #ends the line after loop


    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; 
    exit 
}