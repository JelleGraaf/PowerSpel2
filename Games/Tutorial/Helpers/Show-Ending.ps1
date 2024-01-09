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


    # Some if statements here. Show things in green for what the played has accomplished and in red for what was skipped.
}