function Show-Map {
    <#
    .SYNOPSIS
        Writes a visual representation of the current floor to screen.
        
    .DESCRIPTION
        Writes a visual representation of the current floor to screen. It takes inventory of all te rooms in
        the Rooms folder, organizes them according to their coordinates and writes to them screen in a map.

    .NOTES
        Due to the limited screen space, the map shouldn't be larger than XXX rooms high and XXX rooms wide.
    #>

    Write-Host
    Write-Host "Map here" -ForegroundColor Magenta
    <# WIP
    [string]$CurrentFloor = $($State.CurrentRoom).ToString().substring(4)
    [array]$CurrentFloorRooms = ($World.Keys | Where-Object {$_ -like "*$CurrentFloor"}) | Sort-Object
    foreach ($CurrentFloorRoom in $CurrentFloorRooms) {
    }
    #>
    
}
