function Show-Exits {
    <#
    .SYNOPSIS
        Shows the possible exits of the current room.

    .DESCRIPTION
        Shows the possible exits of the current room. Displays locked doors with parentheses.
    #>

    # Get all possible exits according to the room data file.
    [array]$Exits = $Map."$($State.CurrentRoom)".Exits.Keys

    # Write the exits of the current room to screen. Place locked doors between parentheses.
    Write-Host "[ Exits: " -NoNewline
    foreach ($Exit in $Exits) {
        if (($Map."$($State.CurrentRoom)".Exits.$Exit.LockedDoor) -eq $false) {
            Write-Host "$Exit " -NoNewline
        }
        else {
            Write-Host "($Exit) " -NoNewline
        }
    }
    Write-Host "]"
}
