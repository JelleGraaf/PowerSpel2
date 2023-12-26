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

    TODO: 
    - Make the room options appear in the current room, not the next one.
    - complete the process of picking up an item

#>

param (
    [ValidateSet("Tutorial", "Pentest")]
    [string]$Game = "Pentest"
)


#########################################
#region INITIALIZATION                  #
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
<# LOCAL DEV
$Game = "Tutorial"
$Rooms = Get-ChildItem -Path "C:\git\PowerSpel2\Games\$Game\Rooms\" -File -Recurse
#>
$Map = @{}
foreach ($Room in $Rooms) {
    $RoomCoordinates = $Room.Name.Substring(4).Split('.')[0]
    $Map.$RoomCoordinates = Get-Content $Room | ConvertFrom-Json #-AsHashtable
}

# Prepare global variables
$DirectionTable = @{
    N = "to the north"
    E = "to the east"
    S = "to the south"
    W = "to the west"
    U = "up"
    D = "down"
}
$State = @{
    CurrentRoom  = 505000
    Inventory    = @("Example") # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
    Achievements = @("Good busy", "Tutorial monster") # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
}

#endregion initialization


#########################################
#region MAIN GAME                       #
#########################################

# Start the game with a splash screen.
Show-StartScreen

# Main game loop
while ($State.CurrentRoom -ne "495000") {
    # The number is the game exit room, after which the game ends.
    Clear-Host
    
    # Take inventory of all the items in the current room.
    $Items = @{}
    $Map."$($State.CurrentRoom)".Items.psobject.properties | ForEach-Object { $Items[$_.Name] = $_.Value }
    
    # Write the room content to screen.
    Show-Room
    
    # Write extra room options to screen.
    $RoomOptions = @()
    foreach ($Item in $Items.Keys) {
        $RoomOptions += "Get $($Item.ToLower())."
    }
    if ($RoomOptions) { 
        Show-RoomOptions -RoomOptions $RoomOptions
    }
    
    # Read player action.
    $PlayerInput = Read-Host "What would you like to do?"
    
    $ActionMessage = $null
    if (@("N", "E", "S", "W", "U", "D") -contains $PlayerInput) {
        # Valid moves get processed here.
        $ActionMessage = "You move $($DirectionTable.$PlayerInput)."
        New-Move -Direction $PlayerInput
    }
    elseif (@(0..9) -contains $PlayerInput) {
        # Menu actions get processed here.
        $Action = $RoomOptions[$PlayerInput - 1]

        # Remove the item from the room and add it to inventory
        if ($Action -like "Get *") {
            $PickUpItem = $Action.Substring(4, $($Action.Length - 5))
            Invoke-PickUpItem -PickUpItem $PickUpItem
        }
        $ActionMessage = $Map."$($State.CurrentRoom)".Items.$PickUpItem.PickUpMessage

    }
    else {
        # Invalid input displays a message saying so.
        $ActionMessage = "Invalid input, try again."
    }
    
}


#endregion main game


#region endgame
#Write-Ending

#endregion endgame