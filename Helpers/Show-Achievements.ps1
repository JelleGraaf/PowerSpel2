function Show-Achievements {
    <#
    .SYNOPSIS
        Displays the list of currently uncompleted achievements.
    #>
    
    # Write header to screen.
    Clear-Host
    Show-Header
    Write-Host
    
    # Write list of uncompleted achievements to screen.
    Write-Host "List of achievements you didn't unlock (yet) in this game:"
    foreach ($Achievement in $GameAchievements.Keys) {
        Write-Host "- $Achievement".PadRight(30) -NoNewline -ForegroundColor Cyan
        Write-Host "($($GameAchievements.$Achievement))" -ForegroundColor Cyan
    }
    Write-Host
    Pause
}
    