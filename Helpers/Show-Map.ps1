function Show-Map {
    <#
    .SYNOPSIS
        Writes a visual representation of the current floor to screen.
        
    .DESCRIPTION
        Writes a visual representation of the current floor to screen. It takes inventory of all te rooms in
        the Rooms folder, organizes them according to their coordinates and writes to them screen in a map.

    .NOTES
        Due to the limited screen space, the map shouldn't be larger than XXX rooms high and XXX rooms wide.

        This part is the most ugly code you'll find in the game. I'm not proud of it, but I will hide behind
        the reasoning "If it looks stupid but it works, it ain't stupid". Maybe, some day, I will rewrite this
        to be proper logical and readable code.
    #>

    Write-Host
    Write-Host "Map here" -ForegroundColor Magenta
    [string]$z = $($State.CurrentRoom).ToString().substring(4)
    [array]$CurrentFloorRooms = ($World.Keys | Where-Object { $_ -like "*$z" }) | Sort-Object

    # Sort the rooms by y-axis (to make entire rows)
    $CurrentFloorRoomsRows = $CurrentFloorRooms | Group-Object { [int]$_.Substring(2, 2) }
    
    # Determine the border coordinates of the map
    #$FirstRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[0])
    #$LastRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[-1])
    
    #$CurrentFloorRoomsColumns = $CurrentFloorRooms | Group-Object { [int]$_.Substring(0, 2) }
    #$FirstRowNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[0])
    #$LastRowNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[-1])


    # Loop through the y-axis (20 rooms high)
    for ($y = 60; $y -ge 41; $y--) {
        # Loop through the x-axis (20 rooms wide)
        for ($x = 41; $x -le 60; $x++) {
            if ($CurrentFloorRooms -contains $x.ToString()+$y.ToString()+$z.ToString()) {
                Write-Host "X" -ForegroundColor Red -NoNewline
            } else {
                Write-Host "o" -NoNewline
            }
        }
        Write-Host
    }

    # Loop through all the rooms (sorted)
    
}
