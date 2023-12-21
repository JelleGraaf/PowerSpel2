<#
.SYNOPSIS
    Starts a game of PowerSpel.

.DESCRIPTION
    Starts a game of PowerSpel. Walk through a world in this text-based adventure, styled after the Multi-User Dungeons that were popular in the 90s.

.PARAMETER Game
    Choose the game mode here. Defaults to Pentest, the original PowerSpel.

.NOTES
    Written by Jelle the Graaf (The Netherlands).
    Github: https://github.com/JelleGraaf/PowerSpel2
#>

param (
    [ValidateSet("Tutorial","Pentest")]
    [string]$Game = "Pentest"
)

# Import general helper functions.
$GeneralHelpers = Get-ChildItem -Path $PSScriptRoot\Helpers\
foreach ($GeneralHelper in $GeneralHelpers) {
    . $GeneralHelper.fullname
}

# Import game mode helper functions
$GameHelpers = Get-ChildItem -Path $PSScriptRoot\Games\$Game\
foreach ($GameHelper in $GameHelpers) {
    . $GameHelper.fullname
}

# Start the game with the splash screen
Write-StartScreen

Write-Host "Main game!" -ForegroundColor Green