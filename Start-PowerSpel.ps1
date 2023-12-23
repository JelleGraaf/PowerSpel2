<#
.SYNOPSIS
    Starts a game of PowerSpel.

.DESCRIPTION
    Starts a game of PowerSpel. Walk through a world in this text-based adventure, styled after the Multi-User Dungeons that were popular in the 90s.

.PARAMETER Game
    Choose the game mode here. Defaults to Pentest, the original PowerSpel.

.NOTES
    Written by:       Jelle the Graaf (The Netherlands).
    Source on Github: https://github.com/JelleGraaf/PowerSpel2
#>

param (
    [ValidateSet("Tutorial", "Pentest")]
    [string]$Game = "Pentest"
)


#########################################
#region initialization                  #
#########################################

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
    $Map.$RoomCoordinates = Get-Content $Room | ConvertFrom-Json
}
[int]$CurrentRoom = 505000

# Prepare global variables
$DirectionTable = @{
    N = "to the north"
    E = "to the east"
    S = "to the south"
    W = "to the west"
    U = "up"
    D = "down"
}

#endregion initialization


#########################################
#region MAIN GAME                       #
#########################################

# Start the game with the splash screen
Write-StartScreen

# Main game loop
while ($CurrentRoom -ne "495000") {
    # The number is the game exit room, after which the game ends.
    Clear-Host
    
    Show-Room
    
    $PlayerInput = Read-Host "What would you like to do?"
    
    $Action = $null
    if (@("N", "E", "S", "W", "U", "D") -contains $PlayerInput) {
        # Valid moves get processed here.
        $Action = "You move $($DirectionTable.$PlayerInput)."
        New-Move -Direction $PlayerInput
    }
    elseif (@(0..9) -contains $PlayerInput) {
        # Menu actions get processed here.
        $Action = "Action: $PlayerInput."
    }
    else {
        # Invalid input displays a message saying so.
        $Action = "Invalid input, try again."
    }
    
}


#endregion main game


#region endgame


#endregion endgame