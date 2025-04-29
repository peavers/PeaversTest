# ========================================================
# WoW Addon Deployment Script (PowerShell)
# ========================================================
# Description:
#   This script synchronizes the current directory with the
#   World of Warcraft addon folder. It's used for development
#   to quickly deploy addon updates to the game.
#
# When to run:
#   - After making changes to addon files that you want to test in-game
#   - During development to see immediate changes reflected in WoW
#
# Prerequisites:
#   - WoW client installed at the default Windows location
#   - PowerShell with robocopy capability
#
# Usage:
#   .\deploy_addon.ps1
# ========================================================

$currentDir = Get-Location
$currentDirPath = $currentDir.Path

$folderName = Split-Path -Path $currentDirPath -Leaf
$wowAddonPath = "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\$folderName"

$wowAddonPathNormalized = $wowAddonPath

if (!(Test-Path -Path $wowAddonPathNormalized)) {
    New-Item -ItemType Directory -Path $wowAddonPathNormalized -Force
}

$result = robocopy $currentDirPath $wowAddonPathNormalized /MIR /FFT /Z /W:1 /R:1

Write-Host "Addon deployment complete!"
Write-Host "Deployed to: $wowAddonPathNormalized"
