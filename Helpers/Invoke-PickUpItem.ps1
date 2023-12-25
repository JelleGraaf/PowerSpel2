function Invoke-PickUpItem {
    <#
    .SYNOPSIS
        Removes an item from the current room and adds it to the players inventory.
    #>

    param(
        [parameter(mandatory = $true)]
        [string]$PickUpItem
    )

    # Remove the item from the room in the global map.
    $Map."$($State.CurrentRoom)".Items.PsObject.Properties.Remove("$PickUpItem")
    
    # Add the item to the players inventory.
    $Script:State.Inventory += $PickUpItem

    # Remove the item from the RoomOptions script variable
    $RoomOptions = $RoomOptions | Where-Object {$_ -notcontains $PickUpItem} ## TODO: Make this work
}