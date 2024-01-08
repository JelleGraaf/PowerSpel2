function Show-RoomOptions {
    <#
    .SYNOPSIS
        Writes all extra room options to screen
    
    .DESCRIPTION
        Writes all extra room options to screen in a numbered list. The player will be able to choose an action from that list.
    
    .PARAMETER RoomOptions
        An array of all the extra options in the current room.

    .EXAMPLE
        ps> $Items = @{}
        ps> $Map."$($State.CurrentRoom)".Items.psobject.properties | ForEach-Object { $Items[$_.Name] = $_.Value }
        ps> $RoomOptions = @()
        ps> foreach ($Item in $Items.Keys) { $RoomOptions += "Get $($Item.ToLower())." }
        
        ps> Show-RoomOptions -RoomOptions $RoomOptions
    #>

    param(
        [parameter(mandatory = $true)]
        [array]$RoomOptions
    )

    for ($i = 0; $i -lt $RoomOptions.Count; $i++) {
        # Make the RoomOption all lowercase, then make the first character uppercase
        $RoomOptionsFormatted = $RoomOptions[$i].Substring(0,1).ToUpper() + $RoomOptions[$i].Substring(1).ToLower()
        Write-Host "$($i+1): $RoomOptionsFormatted" -ForegroundColor Gray
    }
    
    Write-Host
}
