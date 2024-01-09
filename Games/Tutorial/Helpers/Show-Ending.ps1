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


    # Some if statements here. Show things in green for what the played has accomplished and in red for what was skipped.
    Start-Sleep 1
    if ($State.Achievements -contains "Attic explorer") {
        Write-Host "You have visted the attic. Seen any ghosts?" -ForegroundColor Green
    }
    else {
        Write-Host "You did not visit the attic. Are you sure you are OK with that?" -ForegroundColor Red
    }
    Start-Sleep 1

    if ($State.Achievements -contains "Collector") {
        Write-Host "You have collected both the mug and the pen. You hoarder, you!" -ForegroundColor Green
    }
    else {
        Write-Host "You did get all available items. Next time, look closer for pick-ups!" -ForegroundColor Red
    }
    Start-Sleep 1

    Write-Host "Einde" -ForegroundColor Green
}