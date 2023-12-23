function Show-Room {
    <#
    .SYNOPSIS
        Displays the content of the room to screen.

    #>

    Write-Host "DEV: Currentroom: $CurrentRoom." -ForegroundColor Magenta

    # Write previous action to screen
    if ($Action) {
        Write-WordWrapHost $Action -Color Green
        Write-Host
    }

    # Write room title to screen.
    Write-Host "[$($Map."$CurrentRoom".RoomTitle)]" -BackgroundColor White -ForegroundColor Black
    Write-Host
    
    # Write room description to screen.
    Write-WordWrapHost "$($Map."$CurrentRoom".RoomDescription)"

    # Write exits to screen.
    Write-Host "[ Exits: $($Map."$CurrentRoom".exits) ]"
    Write-Host
}
