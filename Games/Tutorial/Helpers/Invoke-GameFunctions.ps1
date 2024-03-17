function Invoke-GameFunctions {
    <#
    .SYNOPSIS
        Executes functions specifically for this game.
    
    .NOTES
        This function is called from the main game loop in Start-PowerSpel.ps1, right after the player's input.
        Make sure that the functions should and can be executed at that time.
    #>

    Invoke-AchievementCheck

}