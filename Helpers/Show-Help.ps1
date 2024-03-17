function Show-Help {
    <#
    .SYNOPSIS
        Displays the help information for the game.
    #>
    
    # Write header to screen.
    Clear-Host
    Show-Header
    Write-Host
    
    # Write list of commands to screen
    
    Write-Host " _   _ _____ _     ____  _  "
    Write-Host "| | | | ____| |   |  _ \| | "
    Write-Host "| |_| |  _| | |   | |_) | | "
    Write-Host "|  _  | |___| |___|  __/|_| "
    Write-Host "|_| |_|_____|_____|_|   (_) "
    Write-Host
    Write-Host "This is list of all valid commands you can enter:"
    Write-Host "n e s w u d".PadRight(12) -ForegroundColor Cyan -NoNewline
    Write-Host ": Move around in the cardinal directions and up and down with these letters."
    Write-Host "1-9".PadRight(12) -ForegroundColor Cyan -NoNewline
    Write-Host ": Execute extra option in the current room. Only works if extra options are present."
    Write-Host "0".PadRight(12) -ForegroundColor Cyan -NoNewline
    Write-Host ": Show a list of all completed and available achievements."
    Write-Host "quit".PadRight(12) -ForegroundColor Cyan -NoNewline
    Write-Host ": Quits the game."
    
    Write-Host
    Pause
}
    