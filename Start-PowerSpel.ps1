<#
.SYNOPSIS
    Starts a game of PowerSpel.

.DESCRIPTION
    Starts a game of PowerSpel. Walk through a world in this text-based adventure, styled after the Multi-User Dungeons that were popular in the 1990s.

.PARAMETER Game
    Choose the game mode here. Defaults to Pentest, the original PowerSpel.

.EXAMPLE
    ps> Start-PowerSpel.ps1 -Game Tutorial

.NOTES
    Written by:       Jelle the Graaf (The Netherlands).
    Source on Github: https://github.com/JelleGraaf/PowerSpel2
#>

param (
    [ValidateSet("Tutorial", "Pentest")]
    [string]$Game = "Pentest"
)

#########################################
#region INITIALIZATION                  #
#########################################

# Import general helper functions.
<# LOCAL DEV
$GeneralHelpers = Get-ChildItem -Path ./Helpers
#>
$GeneralHelpers = Get-ChildItem -Path $PSScriptRoot\Helpers\
foreach ($GeneralHelper in $GeneralHelpers) {
    . $GeneralHelper.fullname
}

# Import game helper functions
<# LOCAL DEV
$GameHelpers = Get-ChildItem -Path .\Games\tutorial\Helpers -File
#>
$GameHelpers = Get-ChildItem -Path $PSScriptRoot\Games\$Game\Helpers -File
foreach ($GameHelper in $GameHelpers) {
    . $GameHelper.fullname
}

# Import game interactables functions
<# LOCAL DEV
$Interactables = Get-ChildItem -Path .\Games\tutorial\Interactables -File -Filter "*.ps1"
#>
$Interactables = Get-ChildItem -Path $PSScriptRoot\Games\$Game\Interactables -File -Filter "*.ps1"
foreach ($Interactable in $Interactables) {
    . $Interactable.fullname
}

# Load global setting for the loaded game
Initialize-Game

# Force console colors
$Console = $Host.UI.RawUI
$Console.ForegroundColor = "White"
$Console.BackgroundColor = "Black"

# Import rooms
$Rooms = Get-ChildItem -Path "$PSScriptRoot\Games\$Game\Rooms\" -File -Recurse | Where-Object { $_.Name -ne "_RoomTemplate.json" }

# Prepare variables
<# LOCAL DEV
$Game = "Tutorial"
$Rooms = Get-ChildItem -Path "C:\git\PowerSpel2\Games\$Game\Rooms\" -File -Recurse | Where-Object {$_.Name -ne "_RoomTemplate.json"}
#>
$World = @{}
foreach ($Room in $Rooms) {
    $RoomCoordinates = $Room.Name.Substring(4).Split('.')[0]
    $World.$RoomCoordinates = Get-Content $Room | ConvertFrom-Json -AsHashtable
}

$State = @{
    CurrentRoom  = 524950 #$StartRoom
    Inventory    = @() # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
    Achievements = @() # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
    RoomsVisited = @($StartRoom)
}
<# LOCAL DEV
$GameAchievements = Get-Content ".\Games\$Game\Data\GameAchievements.json" | ConvertFrom-Json -AsHashtable
#>
$GameAchievements = Get-Content "$PSScriptRoot\Games\$Game\Data\GameAchievements.json" | ConvertFrom-Json -AsHashtable
$GameState = "Running"
$StartTime = Get-Date

#endregion initialization


#########################################
#region MAIN GAME                       #
#########################################

# Start the game with a splash screen.
Show-StartScreen

# Main game loop
while ($GameState -ne "Quit") {
    # The number is the game exit room, after which the game ends.
    Clear-Host
    
    # Take inventory of all the items and interactables in the current room.
    $Items = @{}
    foreach ($Item in $World."$($State.CurrentRoom)".Items.Keys) {
        $Items.$Item = $World."$($State.CurrentRoom)".Items.$Item
    }
    $Interactables = @{}  
    foreach ($Interactable in $World."$($State.CurrentRoom)".Interactables.Keys) {
        $Interactables.$Interactable = $World."$($State.CurrentRoom)".Interactables.$Interactable
    }

    # Write the room content to screen.
    Show-Room
    
    # Write extra room options to screen, if any.
    $RoomOptions = @{}
    $i = 1
    if ($Items.Count -gt 0) {
        foreach ($Item in $Items.Keys) {
            $RoomOptions.$i = "Get $Item."
            $i++
        }
    }
    if ($Interactables.Count -gt 0) {
        foreach ($InteractableName in $Interactables.Keys) {
            $RoomOptions.$i = $World."$($State.CurrentRoom)".Interactables.$InteractableName.MenuDescription
            $i++
        }
    }
    if ($RoomOptions.Count -gt 0) {
        Show-RoomOptions -RoomOptions $RoomOptions
    }

    # Read player action.
    $PlayerInput = Read-Host "What would you like to do?"
    
    $ActionMessage = $null
    # Process valid moves.
    if (@("N", "E", "S", "W", "U", "D") -contains $PlayerInput) {
        New-Move -Direction $PlayerInput
    }
    # Process menu actions.
    elseif (@(1..9) -contains $PlayerInput -and $PlayerInput -le $RoomOptions.Count) {
        # My first try to fill $Action is below. That didn't work, for some reason. Below that is something that does work.
        # $Action = $RoomOptions.$PlayerInput
        $Action = $RoomOptions[$RoomOptions.Keys[$PlayerInput-1]][0]

        # Remove the item from the room and add it to inventory.
        if ($Action -like "Get *") {
            $PickUpItem = $Action.Substring(4, $($Action.Length - 5))
            $ActionMessage = $World."$($State.CurrentRoom)".Items.$PickUpItem.PickUpMessage
            $World."$($State.CurrentRoom)".Items.Remove("$PickUpItem")
            $State.Inventory += $PickUpItem
            $PickUpItem = $null
        }
        # Process room item.
        else {
            $ActionMessage = "Processed room item XXX."
        }
    }

    # Show achievement overview.
    elseif ($PlayerInput -eq 0) {
        Show-Achievements
    }
    # Exit command.
    elseif ($PlayerInput -eq "quit") {
        $GameState = "quit"
    }
    # Catch all for invalid input.
    else {
        $ActionMessage = "Invalid input, try again."
    }
    
    Invoke-AchievementCheck
}

#########################################
#region ENDING                          #
#########################################

Show-Ending

#endregion endgame