function Show-MapCompact {
    <#
    .SYNOPSIS
        Writes a visual representation of the current floor to screen. Uses a more compact style.
        
    .DESCRIPTION
        Writes a visual representation of the current floor to screen. Uses a more compact style.
        This compact style doesn't support doors, so it is not or less suited for worlds where
        doors exist.

    .NOTES
        Makes use of these symbols from the ASCII table:
        250: · for exit N, E, S, ór W
        192: └ for exits N E
        124: | for exits N S
        217: ┘ for exits N W
        195: ├ for exits N E S
        193: ┴ for exits N E W
        180: ┤ for exits N S W
        197: ┼ for exits N E S W
        191: ┐ for exits S W
        194: ┬ for exits E S W
        196: ─ for exits E W
        218: ┌ for exits E S

    #>

    $CurrentX = [int]$($State.CurrentRoom).ToString().substring(0, 2)
    $CurrentY = [int]$($State.CurrentRoom).ToString().substring(2, 2)
    $MapLeftBoundary = $CurrentX - 10 # The lowest x-axis number to display on the map.
    $MapRightBoundary = $CurrentX + 10 # The highest x-axis number to display on the map.
    $MapBottomBoundary = $CurrentY - 5 # The lowest y-axis number to display on the map.
    $MapTopBoundary = $CurrentY + 5 # The highest y-axis number to display on the map.
    [string]$z = $($State.CurrentRoom).ToString().substring(4)
    [array]$CurrentFloorRooms = ($World.Keys | Where-Object { $_ -like "*$z" }) | Sort-Object

    # Sort the rooms by y-axis (to make entire rows).
    $CurrentFloorRoomsRows = $CurrentFloorRooms | Group-Object { [int]$_.Substring(2, 2) }
    
    # Sort the rooms by x-axis (to make entire columns).
    $CurrentFloorRoomsColumns = $CurrentFloorRooms | Group-Object { [int]$_.Substring(0, 2) }
    
    # Check to see if the map falls outside the displayable range.
    # Determine the border coordinates of the map.
    $LowestRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[0])
    $HighestRowNumber = [convert]::ToInt32($CurrentFloorRoomsRows.Name[-1])
    $LowestColumnNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[0])
    $HighestColumnNumber = [convert]::ToInt32($CurrentFloorRoomsColumns.Name[-1])

    # Loop through the y-axis.
    for ($y = $MapTopBoundary; $y -ge $MapBottomBoundary ; $y--) {
        # Loop through the x-axis.
        for ($x = $MapLeftBoundary; $x -le $MapRightBoundary; $x++) {
            $CurrentMapRoom = $x.ToString() + $y.ToString() + $z.ToString()
            # Trigger if there is a room at the current coordinates.
            if ($CurrentFloorRooms -contains $CurrentMapRoom) {
                # Set color, according to conditions
                $ForegroundColor = "Red"
                if ($State.CurrentRoom -eq $CurrentMapRoom) {
                    $ForegroundColor = "Yellow"
                }
                # Exits N
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "^" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N E
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "└" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N S
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "|" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N W
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "|" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N E S
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "├" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N E W
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "┴" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N S W
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "┤" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits N E S W
                elseif ($World."$CurrentMapRoom".Exits.Keys -contains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "┼" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits E
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host ">" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits E S
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "┌" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits E W
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "─" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits E S W
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "┬" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits S
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "West") {
                    Write-Host "v" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits S W
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "┐" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Exits W
                elseif ($World."$CurrentMapRoom".Exits.Keys -notcontains "North" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "East" -and `
                        $World."$CurrentMapRoom".Exits.Keys -notcontains "South" -and `
                        $World."$CurrentMapRoom".Exits.Keys -contains "West") {
                    Write-Host "<" -ForegroundColor $ForegroundColor -NoNewline
                }
                # Write a red dollar sign for something unexpected.
                else {
                    Write-Host "$" -ForegroundColor Red -NoNewline
                }
            } 
            # Write space for a non-existent room.
            else {
                Write-Host " " -NoNewline
            }
        }
        Write-Host
    }
}
