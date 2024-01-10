function Show-Ending {
    <#
    .SYNOPSIS
        Displays the result of the game.
        
    .DESCRIPTION
        Displays the result of the game. Tallies up all achievements and goals and gives you a final score of the game.
    #>

    Clear-Host
    Write-Host "              ▄███████▄  ▄██████▄   ▄█     █▄     ▄████████    ▄████████    ▄████████    ▄███████▄    ▄████████  ▄█       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███   ███    ███   ███    ███   ███    ███   ███    ███   ███    ███ ███       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███   ███    █▀    ███    ███   ███    █▀    ███    ███   ███    █▀  ███       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███          ███    ███  ▄███▄▄▄     ███       " -ForegroundColor Red
    Write-Host "           ▀█████████▀  ███    ███ ███     ███ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ ▀█████████▀  ▀▀███▀▀▀     ███       " -ForegroundColor Red
    Write-Host "             ███        ███    ███ ███     ███   ███    █▄  ▀███████████          ███   ███          ███    █▄  ███       " -ForegroundColor Red
    Write-Host "             ███        ███    ███ ███ ▄█▄ ███   ███    ███   ███    ███    ▄█    ███   ███          ███    ███ ███▌    ▄ " -ForegroundColor Red
    Write-Host "            ▄████▀       ▀██████▀   ▀███▀███▀    ██████████   ███    ███  ▄████████▀   ▄████▀        ██████████ █████▄▄██ " -ForegroundColor Red
    Write-Host "                                                              ███    ███                                        ▀         " -ForegroundColor Red
    Start-Sleep 1              
    Write-Host
    Write-Host "                                  ▄████████    ▄████████    ▄████████ ███    █▄   ▄█           ███    " -ForegroundColor White
    Write-Host "                                 ███    ███   ███    ███   ███    ███ ███    ███ ███       ▀█████████▄" -ForegroundColor White
    Write-Host "                                 ███    ███   ███    █▀    ███    █▀  ███    ███ ███          ▀███▀▀██" -ForegroundColor White
    Write-Host "                                ▄███▄▄▄▄██▀  ▄███▄▄▄       ███        ███    ███ ███           ███   ▀" -ForegroundColor White
    Write-Host "                               ▀▀███▀▀▀▀▀   ▀▀███▀▀▀     ▀███████████ ███    ███ ███           ███    " -ForegroundColor White
    Write-Host "                               ▀███████████   ███    █▄           ███ ███    ███ ███           ███    " -ForegroundColor White
    Write-Host "                                 ███    ███   ███    ███    ▄█    ███ ███    ███ ███▌    ▄     ███    " -ForegroundColor White
    Write-Host "                                 ███    ███   ██████████  ▄████████▀  ████████▀  █████▄▄██    ▄████▀  " -ForegroundColor White
    Write-Host "                                 ███    ███                                      ▀                    " -ForegroundColor White
    Write-Host


    # Attic explorer achievement
    Start-Sleep 1
    if ($State.Achievements -contains "Attic explorer") {
        Write-Host "You have visted the attic. Seen any ghosts?" -ForegroundColor Green
    }
    else {
        Write-Host "You did not visit the attic. Are you sure you are OK with that?" -ForegroundColor Red
    }
    Start-Sleep 1

    # Collector achievement
    if ($State.Achievements -contains "Collector") {
        Write-Host "You have collected both the mug and the pen. You hoarder, you!" -ForegroundColor Green
    }
    else {
        Write-Host "You did get all available items. Next time, look closer for pick-ups!" -ForegroundColor Red
    }
    Start-Sleep 1

    # Rooms visited
    Write-Host "You visited $($State.RoomsVisited.Count) out of $($World.count -1) unique rooms." -ForegroundColor Yellow
    Write-Host "Einde" -ForegroundColor Green
}