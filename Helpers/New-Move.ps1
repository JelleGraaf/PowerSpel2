function New-Move {
    <#
    .SYNOPSIS
        Moves the character to a different room.

    .PARAMETER direction
        Direction of the room to move to, relative to the current room.
    #>

    param(
        [ValidateSet("N","E","S","W","U","D")]
        [string]$Direction
    )

    switch ($Direction) {
        N { [int]$DestinationRoom = $State.CurrentRoom +   100 }
        S { [int]$DestinationRoom = $State.CurrentRoom -   100 }
        E { [int]$DestinationRoom = $State.CurrentRoom + 10000 }
        W { [int]$DestinationRoom = $State.CurrentRoom - 10000 }
        U { [int]$DestinationRoom = $State.CurrentRoom +     1 }
        D { [int]$DestinationRoom = $State.CurrentRoom -     1 }
    }

    # Check to see if there is a room with the correct coordinates in the map, and an exit in the room info which corresponds with the Direction.
    if ($Map.Keys -contains $Destinationroom -and (($Map."$($State.CurrentRoom)".Exits).substring(0,1) -contains $Direction)) {
        $Script:State.CurrentRoom = $DestinationRoom
    }
    else {
        $Script:Action = "You can't go that way. Try again."
    }
}
