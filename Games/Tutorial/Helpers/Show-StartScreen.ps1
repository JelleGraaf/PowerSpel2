function Show-StartScreen {
    <#
    .SYNOPSIS
        Presents the splash screen and introduction text.

    .NOTES
        Source: https://www.asciiart.eu/text-to-ascii-art
        Font  : Ansi -> Delta Corps Priest 1
    #>

    # Write ASCII art
    Clear-Host
    Write-Host 
    Write-Host 
    Write-Host 
    Write-Host 
    Write-Host 
    Write-Host 
    Write-Host "              ▄███████▄  ▄██████▄   ▄█     █▄     ▄████████    ▄████████    ▄████████    ▄███████▄    ▄████████  ▄█       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███   ███    ███   ███    ███   ███    ███   ███    ███   ███    ███ ███       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███   ███    █▀    ███    ███   ███    █▀    ███    ███   ███    █▀  ███       " -ForegroundColor Red
    Write-Host "             ███    ███ ███    ███ ███     ███  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███          ███    ███  ▄███▄▄▄     ███       " -ForegroundColor Red
    Write-Host "           ▀█████████▀  ███    ███ ███     ███ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ ▀█████████▀  ▀▀███▀▀▀     ███       " -ForegroundColor Red
    Write-Host "             ███        ███    ███ ███     ███   ███    █▄  ▀███████████          ███   ███          ███    █▄  ███       " -ForegroundColor Red
    Write-Host "             ███        ███    ███ ███ ▄█▄ ███   ███    ███   ███    ███    ▄█    ███   ███          ███    ███ ███▌    ▄ " -ForegroundColor Red
    Write-Host "            ▄████▀       ▀██████▀   ▀███▀███▀    ██████████   ███    ███  ▄████████▀   ▄████▀        ██████████ █████▄▄██ " -ForegroundColor Red
    Write-Host "                                                              ███    ███                                        ▀         " -ForegroundColor Red
    Write-Host
    Write-Host "                            ███     ███    █▄      ███      ▄██████▄     ▄████████  ▄█     ▄████████  ▄█       " -ForegroundColor Red
    Write-Host "                        ▀█████████▄ ███    ███ ▀█████████▄ ███    ███   ███    ███ ███    ███    ███ ███       " -ForegroundColor Red
    Write-Host "                           ▀███▀▀██ ███    ███    ▀███▀▀██ ███    ███   ███    ███ ███▌   ███    ███ ███       " -ForegroundColor Red
    Write-Host "                            ███   ▀ ███    ███     ███   ▀ ███    ███  ▄███▄▄▄▄██▀ ███▌   ███    ███ ███       " -ForegroundColor Red
    Write-Host "                            ███     ███    ███     ███     ███    ███ ▀▀███▀▀▀▀▀   ███▌ ▀███████████ ███       " -ForegroundColor Red
    Write-Host "                            ███     ███    ███     ███     ███    ███ ▀███████████ ███    ███    ███ ███       " -ForegroundColor Red
    Write-Host "                            ███     ███    ███     ███     ███    ███   ███    ███ ███    ███    ███ ███▌    ▄ " -ForegroundColor Red
    Write-Host "                           ▄████▀   ████████▀     ▄████▀    ▀██████▀    ███    ███ █▀     ███    █▀  █████▄▄██ " -ForegroundColor Red
    Write-Host "                                                                        ███    ███                   ▀         " -ForegroundColor Red
    Write-Host
    Write-Host
    Write-Host
    Write-Host
    Write-Host "                                                           ¯\_(°_o)_/¯" -ForegroundColor DarkGray
    Write-Host
    Write-Host
    Write-Host
    Write-Host

    # Write explanation
    Write-WordWrapHost "Welcome to the PowerSpel tutorial!"
    Write-Host ""
    Write-WordWrapHost "In this game, you will be introduced to the basic game mechanics. You can practice with the commands. After that, you are ready to try a real game. What are you waiting for? Jump right in!"
    Write-Host ""
    Pause
}
