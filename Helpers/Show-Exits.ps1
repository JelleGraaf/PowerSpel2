function Show-Exits {
    <#
    .SYNOPSIS
        Shows the possible exits of the current room.

    .DESCRIPTION
        Shows the possible exits of the current room. Displays locked doors with parentheses.
    #>

    # Very ugly code to get all possible exits from the state. Looking for a way to tidy this up.
    [array]$Exits = ($Map."$($State.CurrentRoom)".Exits | Get-Member | Where-Object { $_.Name -notin ("Equals", "GetHashCode", "GetType", "ToString") }).Name

    # Write the exits of the current room to screen. Place locked doors between parentheses.
    Write-Host "[ Exits: " -NoNewline
    foreach ($Exit in $Exits) {
        if (($Map."$($State.CurrentRoom)".ExitsTest.$Exit.LockedDoor) -eq $false) {
            Write-Host "$Exit " -NoNewline
        }
        else {
            Write-Host "($Exit) " -NoNewline
        }
    }
    Write-Host "]"
}
