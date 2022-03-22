#-------------------------------------------------------------------------------------
# Script: SIDTranslator.ps1
# Author: tpez0
# Notes : No warranty expressed or implied.
#         Use at your own risk.
#         Download Remote Server Administration Tools for Win10 https://www.microsoft.com/en-us/download/details.aspx?id=45520
# Function: Translates SID from or to Username or Group   
#            
#--------------------------------------------------------------------------------------
import-module ActiveDirectory

Clear-Host
Write-Host " "
Write-Host "******************************************************" -ForegroundColor Yellow
Write-Host "* Script: SIDTranslator.ps1                          *" -ForegroundColor Yellow
Write-Host "* Author: tpez0                                      *" -ForegroundColor Yellow
Write-Host "* Translate SID from or to Username or Group         *" -ForegroundColor Yellow
Write-Host "*                                                    *" -ForegroundColor Yellow
Write-Host "*                                                    *" -ForegroundColor Yellow
Write-Host "******************************************************" -ForegroundColor Yellow
Write-Host " "

$src = Read-Host -Prompt "Enter a username or SID"
Clear-Host

# if $src is a AD User or Group
if ((Get-ADUser -Filter "sAMAccountName -eq '$src'") -or (Get-ADGroup -Filter "sAMAccountName -eq '$src'")) {
    $nametranslated = (New-Object System.Security.Principal.NTAccount($src)).Translate([System.Security.Principal.SecurityIdentifier]).value

    Write-Host " "
    Write-Host "******************************************************" -ForegroundColor Yellow
    Write-Host "* Script: SIDTranslator.ps1                          *" -ForegroundColor Yellow
    Write-Host "* Author: tpez0                                      *" -ForegroundColor Yellow
    Write-Host "* Translate Username or Group to SID                 *" -ForegroundColor Yellow
    Write-Host "*                                                    *" -ForegroundColor Yellow
    Write-Host "* Username: $src" -ForegroundColor Yellow
    Write-host "* SID: $nametranslated" -ForegroundColor Yellow
    Write-Host "*                                                    *" -ForegroundColor Yellow
    Write-Host "******************************************************" -ForegroundColor Yellow
    Write-Host " "

} else {
    $sidtranslated = (New-Object System.Security.Principal.SecurityIdentifier($src)).Translate([System.Security.Principal.NTAccount]).value

    Write-Host " "
    Write-Host "******************************************************" -ForegroundColor Yellow
    Write-Host "* Script: SIDTranslator.ps1                          *" -ForegroundColor Yellow
    Write-Host "* Author: tpez0                                      *" -ForegroundColor Yellow
    Write-Host "* Translates SID to Username or Group                *" -ForegroundColor Yellow
    Write-Host "*                                                    *" -ForegroundColor Yellow
    Write-Host "* Username: $src" -ForegroundColor Yellow
    Write-host "* SID: $sidtranslated" -ForegroundColor Yellow
    Write-Host "*                                                    *" -ForegroundColor Yellow
    Write-Host "******************************************************" -ForegroundColor Yellow
    Write-Host " "
}
