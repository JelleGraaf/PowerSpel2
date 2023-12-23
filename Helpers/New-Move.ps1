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
        N { $Script:CurrentRoom +=   100 }
        S { $Script:CurrentRoom -=   100 }
        E { $Script:CurrentRoom += 10000 }
        W { $Script:CurrentRoom -= 10000 }
        U { $Script:CurrentRoom +=     1 }
        D { $Script:CurrentRoom -=     1 }
    }
}
