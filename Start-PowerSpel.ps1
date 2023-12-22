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
$GameHelpers = Get-ChildItem -Path $PSScriptRoot\Games\$Game\ -File
foreach ($GameHelper in $GameHelpers) {
    . $GameHelper.fullname
}

# Force console colors
$console = $host.UI.RawUI
$console.ForegroundColor = "white"
$console.BackgroundColor = "black"

# Import map 
$Rooms = Get-ChildItem -Path "$PSScriptRoot\Games\$Game\Rooms\" -File -Recurse
# $Rooms = Get-ChildItem -Path "C:\git\PowerSpel2\Games\$Game\Rooms\" -File -Recurse ## LOCAL DEV
$Map = @{}
foreach ($Room in $Rooms) {
    $RoomCoordinates = $Room.Name.Substring(4).Split('.')[0]
    Write-Host "Processing room $RoomCoordinates..."
    $Map.$RoomCoordinates = Get-Content $Room | ConvertFrom-Json
}
$CurrentRoom = "505000"
#endregion initialization

#region main game
# Start the game with the splash screen
Write-StartScreen

Write-Host "Main game!" -ForegroundColor Green
while ($CurrentRoom -ne "495000") { # The number is the exit room, after which the game ends.
    Show-Room -Coordinates $CurrentRoom # RESUME HERE
}


#endregion main game


#region endgame


#endregion endgame