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

#region initialization
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

# Force console colors
$console = $host.UI.RawUI
$console.ForegroundColor = "white"
$console.BackgroundColor = "black"

$RoomFolder = "$PSScriptRoot\Games\$Game\Rooms\"

#endregion initialization

#region main game
# Start the game with the splash screen
Write-StartScreen

Write-Host "Main game!" -ForegroundColor Green

#endregion main game


#region endgame


#endregion endgame