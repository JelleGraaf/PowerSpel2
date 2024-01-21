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

        Makes use of these symbols from the ASCII table:
        124: |
        180: ┤
        191: ┐
        192: └
        193: ┴
        194: ┬
        195: ├
        196: ─
        197: ┼
        217: ┘
        218: ┌
    #>

    $MapLeftBoundary = 40   # The lowest x-axis number to display on the map
    $MapRightBoundary = 60  # The highest x-axis number to display on the map
    $MapBottomBoundary = 45 # The lowest y-axis number to display on the map
    $MapTopBoundary = 55    # The highest y-axis number to display on the map
    [string]$z = $($State.CurrentRoom).ToString().substring(4)
    [array]$CurrentFloorRooms = ($World.Keys | Where-Object { $_ -like "*$z" }) | Sort-Object

    # Sort the rooms by y-axis (to make entire rows)
    $CurrentFloorRoomsRows = $CurrentFloorRooms | Group-Object { [int]$_.Substring(2, 2) }
    
    # Sort the rooms by x-axis (to make entire columns)
    $CurrentFloorRoomsColumns = $CurrentFloorRooms | Group-Object { [int]$_.Substring(0, 2) }
    
    # Check to see if the map falls outside the displayable range
    # Determine the border coordinates of the map
    $LowestRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[0])
    $HighestRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[-1])
    $LowestColumnNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[0])
    $HighestColumnNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[-1])
    if ($LowestRowNumber -lt $MapBottomBoundary -or $HighestRowNumber -gt $MapTopBoundary -or $LowestColumnNumber -lt $MapLeftBoundary -or $HighestColumnNumber -gt $MapRightBoundary ) { 
        throw "Current floor size is bigger than the map can display. Remove rooms, turn off the map, or increase map size."
    }

    # Loop through the y-axis.
    for ($y = $MapTopBoundary; $y -ge $MapBottomBoundary ; $y--) {
        # Loop through the x-axis.
        for ($x = $MapLeftBoundary; $x -le $MapRightBoundary; $x++) {
            $CurrentMapRoom = $x.ToString() + $y.ToString() + $z.ToString()
            # Trigger if there is a room at the current coordinates.
            if ($CurrentFloorRooms -contains $CurrentMapRoom) {
                # Write an X inside a room if the player is there.
                if ($State.CurrentRoom -eq $CurrentMapRoom) {
                    Write-Host "@" -ForegroundColor Yellow -NoNewline
                }
                # Write X when there is an exit up and down.
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "Up" -and $World."$CurrentMapRoom".Exits.Keys -contains "Down") {
                    Write-Host "♢" -ForegroundColor DarkGray -NoNewline
                }
                # Write ^ when there is an exit up.
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "Up") {
                    Write-Host "^" -ForegroundColor DarkGray -NoNewline
                }
                # Write X when there is an exit down.
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "Down") {
                    Write-Host "v" -ForegroundColor DarkGray -NoNewline
                }
                # Write a space for an empty room.
                else {
                    Write-Host " " -NoNewline
                }
                if ($World."$CurrentMapRoom".Exits.East) {
                    # Locked doors are displayed like walls, but colored red. Open exits are displayed with a space.
                    if ($World."$CurrentMapRoom".Exits.East.LockedDoor -eq $true) {
                        Write-Host "|" -ForegroundColor Red -NoNewline
                    }
                    else {
                        Write-Host " " -NoNewline
                    }
                }
                # Always place a wall to the east of a room, if it doesn't have an exit in that direction.
                else {
                    Write-Host "|" -NoNewline
                }
            } 
            # If a room to the east of a non-existent room exists, write a wall in between.
            elseif ($CurrentFloorRooms -contains ($x + 1).ToString() + $y.ToString() + $z.ToString()) {
                Write-Host " |" -NoNewline
            }
            # Write for a non-existent room
            else {
                Write-Host " ·" -ForegroundColor DarkGray -NoNewline
            }
        }
        Write-Host

        # Loop through the x-axis a second time, for the line with walls and corner pieces
        for ($x = $MapLeftBoundary; $x -le $MapRightBoundary; $x++) {
            $CurrentMapRoom = $x.ToString() + $y.ToString() + $z.ToString()
            $RoomToTheEast = ($x + 1).ToString() + $y.ToString() + $z.ToString()
            $RoomToTheSouth = $x.ToString() + ($y - 1).ToString() + $z.ToString()
            $RoomToTheSouthEast = ($x + 1).ToString() + ($y - 1).ToString() + $z.ToString()

            ## DRAW WALL PIECES
            # Trigger if the current position contains a room.
            if ($CurrentFloorRooms -contains $CurrentMapRoom) {
                # Trigger if there is a room to the south.
                if ($CurrentFloorRooms -contains $RoomToTheSouth -and $World."$CurrentMapRoom".Exits.South) {
                    # Trigger if there is a locked door to the south.
                    if ($World."$CurrentMapRoom".Exits.South.LockedDoor -eq $true) {
                        Write-Host "─" -ForegroundColor Red -NoNewline
                    }
                    else {
                        Write-Host " " -NoNewline
                    }
                }
                # Trigger if there is no room to the south.
                else {
                    Write-Host "─" -NoNewline
                }
            }
            # Trigger if the current position does not contain a room.
            else {
                # Trigger if there is a room to the south.
                if ($CurrentFloorRooms -contains $RoomToTheSouth) {
                    Write-Host "─" -NoNewline
                }
                else {
                    Write-Host " " -NoNewline 
                }
            }

            ## DRAW CORNER PIECES
            # Room to the east, not to the south or southeast.
            if ($CurrentFloorRooms -contains $RoomToTheEast -and $CurrentFloorRooms -notcontains $RoomToTheSouth -and $CurrentFloorRooms -notcontains $RoomToTheSouthEast) {
                if ($CurrentFloorRooms -contains $CurrentMapRoom) { Write-Host "┴" -NoNewline }
                else { Write-Host "└" -NoNewline }
            }
            # Room to the south, not to the east or southeast.
            elseif ($CurrentFloorRooms -notcontains $RoomToTheEast -and $CurrentFloorRooms -contains $RoomToTheSouth -and $CurrentFloorRooms -notcontains $RoomToTheSouthEast) {
                if ($CurrentFloorRooms -contains $CurrentMapRoom) { Write-Host "┤" -NoNewline }
                else { Write-Host "┐" -NoNewline }
            }
            # Room to the southeast, not to the east or south.
            elseif ($CurrentFloorRooms -notcontains $RoomToTheEast -and $CurrentFloorRooms -notcontains $RoomToTheSouth -and $CurrentFloorRooms -contains $RoomToTheSouthEast) {
                Write-Host "┌" -NoNewline
            }
            # Rooms to the south and southeast, not to the east.
            elseif ($CurrentFloorRooms -notcontains $RoomToTheEast -and $CurrentFloorRooms -contains $RoomToTheSouth -and $CurrentFloorRooms -contains $RoomToTheSouthEast) {
                if ($CurrentFloorRooms -contains $CurrentMapRoom) { Write-Host "┼" -NoNewline }
                else { Write-Host "┬" -NoNewline }
            }
            # Rooms to the east and southeast, not to the south.
            elseif ($CurrentFloorRooms -contains $RoomToTheEast -and $CurrentFloorRooms -notcontains $RoomToTheSouth -and $CurrentFloorRooms -contains $RoomToTheSouthEast) {
                Write-Host "├" -NoNewline
            }
            # Rooms to the east and south, not to the southeast.
            elseif ($CurrentFloorRooms -contains $RoomToTheEast -and $CurrentFloorRooms -contains $RoomToTheSouth -and $CurrentFloorRooms -notcontains $RoomToTheSouthEast) {
                Write-Host "┼" -NoNewline
            }
            # Rooms to the east, south, and southeast.
            elseif ($CurrentFloorRooms -contains $RoomToTheEast -and $CurrentFloorRooms -contains $RoomToTheSouth -and $CurrentFloorRooms -contains $RoomToTheSouthEast) {
                Write-Host "┼" -NoNewline
            }
            # No rooms to south, east or southeast.
            elseif ($CurrentFloorRooms -notcontains $RoomToTheEast -and $CurrentFloorRooms -notcontains $RoomToTheSouth -and $CurrentFloorRooms -notcontains $RoomToTheSouthEast) {
                if ($CurrentFloorRooms -contains $CurrentMapRoom) { Write-Host "┘" -NoNewline }
                else { Write-Host " " -NoNewline }
            } 
            # Display $ if something unexpected happens.
            else {
                Write-Host "$" -NoNewline -ForegroundColor Red
            }
        }
        Write-Host
    }
}
