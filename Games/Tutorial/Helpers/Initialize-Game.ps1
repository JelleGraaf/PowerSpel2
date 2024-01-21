function Initialize-Game {
    <#
    .SYNOPSIS
        This script sets variables that are unique to this specific game.
    #>
    
    $Script:MapStyle = "Static" # Select the map style. Valid options: Static, Dynamic, Off.
    $Script:StartRoom = 505050 # Enter the coordinates of the room where the game starts. Valid options: any room number in your game (six digits).
}
