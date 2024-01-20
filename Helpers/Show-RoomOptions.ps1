function Show-RoomOptions {
    <#
    .SYNOPSIS
        Writes all extra room options to screen.
    
    .DESCRIPTION
        Writes all extra room options (items and interactables) to screen in a numbered list. The player will be able to choose an action from that list.
    
    .PARAMETER RoomOptions
        A hashtable of all the extra options in the current room.
    
    .EXAMPLE
        ps> $RoomObjects = @{}
        ps> $i = 1
        ps> foreach ($Item in $World."$($State.CurrentRoom)".Items.Keys) { $RoomObjects.$i = $World."$($State.CurrentRoom)".Items.$Item; $i++ }

        ps> Show-RoomOptions -RoomOptions $RoomObjects
    #>

    param(
        [parameter(mandatory = $true)]
        [hashtable]$RoomObjects
    )

    foreach ($RoomObject in $RoomObjects.Keys | Sort-Object) {
        Write-Host "$RoomObject`: $($RoomObjects.$RoomObject.MenuDescription)" -ForegroundColor Gray
    }

    Write-Host
}
