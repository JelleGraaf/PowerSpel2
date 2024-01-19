function Show-RoomOptions {
    <#
    .SYNOPSIS
        Writes all extra room options to screen.
    
    .DESCRIPTION
        Writes all extra room options (items and interactables) to screen in a numbered list. The player will be able to choose an action from that list.
    
    .PARAMETER RoomOptions
        A hashtable of all the extra options in the current room.

    .EXAMPLE
        ps> $Items = @{}
        ps> foreach ($Item in $World."$($State.CurrentRoom)".Items.Keys) { $Items.$Item = $World."$($State.CurrentRoom)".Items.$Item }
        ps> $RoomOptions = @()
        ps> $i = 1
        ps> foreach ($Item in $Items.Keys) { $RoomOptions.$i = "Get $Item."; $i++ }
        
        ps> Show-RoomOptions -RoomOptions $RoomOptions
    #>

    param(
        [parameter(mandatory = $true)]
        [hashtable]$RoomOptions
    )

    foreach ($RoomOption in $RoomOptions.Keys | Sort-Object) {
        # Make the first letter of RoomOption uppercase, then make the rest lowercase.
        $RoomOptionsFormatted = $RoomOptions.$RoomOption.Substring(0,1).ToUpper() + $RoomOptions.$RoomOption.Substring(1).ToLower()
        Write-Host "$RoomOption`: $RoomOptionsFormatted" -ForegroundColor Gray
    }

    Write-Host
}
