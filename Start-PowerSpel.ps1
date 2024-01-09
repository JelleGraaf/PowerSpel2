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

# Force console colors
$Console = $Host.UI.RawUI
$Console.ForegroundColor = "White"
$Console.BackgroundColor = "Black"

# Import rooms
$Rooms = Get-ChildItem -Path "$PSScriptRoot\Games\$Game\Rooms\" -File -Recurse
<# LOCAL DEV
$Game = "Tutorial"
$Rooms = Get-ChildItem -Path "C:\git\PowerSpel2\Games\$Game\Rooms\" -File -Recurse
#>
$World = @{}
foreach ($Room in $Rooms) {
    $RoomCoordinates = $Room.Name.Substring(4).Split('.')[0]
    $World.$RoomCoordinates = Get-Content $Room | ConvertFrom-Json -AsHashtable
}

# Prepare global variables
$State = @{
    CurrentRoom  = 505000
    Inventory    = @() # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
    Achievements = @() # Don't fill this with text longer than the respective header column, or it will mess up the visualization.
}
<# LOCAL DEV
$GameAchievements = Get-Content ".\Games\$Game\Data\GameAchievements.json" | ConvertFrom-Json -AsHashtable
#>
$GameAchievements = Get-Content "$PSScriptRoot\Games\$Game\Data\GameAchievements.json" | ConvertFrom-Json -AsHashtable

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
    foreach ($Item in $World."$($State.CurrentRoom)".Items.Keys) {
        $Items.$Item = $World."$($State.CurrentRoom)".Items.$Item
    }    
    
    # Write the room content to screen.
    Show-Room
    
    # Write extra room options to screen, if any.
    $RoomOptions = @()
    if ($Items.Count -gt 0) {
        foreach ($Item in $Items.Keys) {
            $RoomOptions += "Get $Item."
        }
        Show-RoomOptions -RoomOptions $RoomOptions
    }
    
    # Read player action.
    $PlayerInput = Read-Host "What would you like to do?"
    
    $ActionMessage = $null
    if (@("N", "E", "S", "W", "U", "D") -contains $PlayerInput) {
        # Valid moves get processed here.
        New-Move -Direction $PlayerInput
    }
    elseif (@(1..9) -contains $PlayerInput -and $RoomOptions.Count -gt 0) {
        # Menu actions get processed here.
        $Action = $RoomOptions[$PlayerInput - 1]

        # Remove the item from the room and add it to inventory
        if ($Action -like "Get *") {
            $PickUpItem = $Action.Substring(4, $($Action.Length - 5))
            $ActionMessage = $World."$($State.CurrentRoom)".Items.$PickUpItem.PickUpMessage
            $World."$($State.CurrentRoom)".Items.Remove("$PickUpItem")
            $State.Inventory += $PickUpItem
            $PickUpItem = $null
        }
        else {
            # Process room item
            $ActionMessage = "Processed room item XXX"
        }
    }
    elseif ($PlayerInput -eq 0) {
        Show-Achievements
    }
    else {
        # Invalid input gets processed here.
        $ActionMessage = "Invalid input, try again."
    }
    
    # Check for completed achievements.
    ## Collector
    if ($State.Inventory -contains "A pen" -and $State.Inventory -contains "A mug") {
        $AchievementName = "Collector"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

    ## Attic explorer
    if ($State.CurrentRoom -eq 505001) {
        $AchievementName = "Attic explorer"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }

    }
}

#########################################
#region endgame                         #
#########################################
#Write-Ending
Write-Host
Write-Host "Einde!" -ForegroundColor Green

#endregion endgame