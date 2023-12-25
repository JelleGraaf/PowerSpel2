function Show-RoomOptions {
    <#
    .SYNOPSIS
        Writes all extra room options to screen
    
    .DESCRIPTION
        Writes all extra room options to screen in a numbered list. The player will be able to choose an action from that list.
    
    .PARAMETER RoomOptions
        An array of all the extra options in the current room.
    #>

    param(
        [parameter(mandatory = $true)]
        [array]$RoomOptions
    )

    for ($i = 0; $i -lt $RoomOptions.Count; $i++) {
        Write-Host "$($i+1): $($RoomOptions[$i])" -ForegroundColor Gray
    }

}