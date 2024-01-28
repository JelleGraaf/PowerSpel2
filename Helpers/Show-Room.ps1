function Show-Room {
    <#
    .SYNOPSIS
        Displays the content of the room to screen.
    #>

    # Write header to screen.
    Show-Header

    # Write map to screen, if enabled.
    if ($MapStyle -ne "Off") {
        Show-Map -MapStyle $MapStyle
    }
    
    # Write previous action to screen, if any.
    if ($ActionMessage) {
        Write-WordWrapHost $ActionMessage -Color Green
        if (!$CompletedAchievement) { Write-Host } # Skip this empty line when an achievement is completed, it looks better that way.
    }

    # Write completed achievements to screen, if any.
    if ($CompletedAchievement) {
        Write-Host ">>> You have completed the achievement '$CompletedAchievement'! <<<" -ForegroundColor Yellow
        Write-Host
        $Script:CompletedAchievement = $null
    }

    # Write room title to screen.
    Write-Host " [$($World."$($State.CurrentRoom)".RoomTitle)] " -BackgroundColor White -ForegroundColor Black
    Write-Host
    
    # Write room description to screen.
    Write-WordWrapHost "$($World."$($State.CurrentRoom)".RoomDescription)"

    # Write exits to screen.
    Show-Exits

    # Write room items and interactables to screen.
    foreach ($RoomObject in $RoomObjects.Keys | Sort-Object) {
        Write-Host $RoomObjects.$RoomObject.ItemDescription -ForegroundColor Cyan
    }
    Write-Host
}
