function Show-Ending {
    <#
    .SYNOPSIS
        Displays the result of the game.
        
    .DESCRIPTION
        Displays the result of the game. Tallies up all achievements and goals and gives you a final score of the game.
    #>

    Clear-Host
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
    Write-Host
    Start-Sleep 1              

    # Time played.
    Write-Host "You have played for a total of " -NoNewline
    Write-Host ((Get-Date) - $StartTime).Minutes -ForegroundColor Green -NoNewline
    Write-Host " minutes."

    # Unique Rooms visited.
    Write-Host
    Show-ScoreMeter -ScoreName "Unique rooms visited" -ScoreValue $State.RoomsVisited.Count -ScoreMaxValue $World.count
    
    # Achievements.
    Write-Host
    Write-Host "*** ACHIEVEMENTS ***"
    Start-Sleep -Milliseconds 1000
    foreach ($Achievement in $State.Achievements) {
        Write-Host "You have completed the achievement '$Achievement'" -ForegroundColor Green
        Start-Sleep -Milliseconds 100
    }
    
    foreach ($UncompletedAchievement in $GameAchievements.Keys) {
        Write-Host "You have not completed the achievement '$UncompletedAchievement'." -ForegroundColor Red
        Start-Sleep -Milliseconds 100
    }
    
    Start-Sleep -Milliseconds 1000

    # Final words.
    Write-Host
    Write-Host "Thank you for playing PowerSpel!" -ForegroundColor Yellow
    Write-Host
    Start-Sleep -Milliseconds 2000
}
