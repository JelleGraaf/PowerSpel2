function Invoke-SodaMachine {
    <#
    .SYNOPSIS
        Starts the interactable Soda Machine.
        
    .DESCRIPTION
        Starts the interactable Soda Machine. It presents the player with a menu, in which they can
        select a certain sode can. Once selected, the can goes into the inventory.
    #>

    # Import machine data from file.
    $InteractableData = Get-Content "$PSScriptRoot\SodaMachine.json" | ConvertFrom-Json -AsHashtable
    
    # Write header to screen.
    Show-Header

    # Write map to screen, if enabled.
    if ($MapOn -eq $true) {
        Show-Map
    }
    
    # Write previous action to screen, if any.
    if ($ActionMessage) {
        Write-WordWrapHost $ActionMessage -Color Green
        if (!$CompletedAchievement) { Write-Host } # Skip this empty line when an achievement is completed, it looks better that way.
    }
    # Write room title to screen.
    Write-Host "[$($World."$($State.CurrentRoom)".RoomTitle)]" -BackgroundColor White -ForegroundColor Black
    Write-Host
    
    # Write room description to screen.
    Write-WordWrapHost "$($World."$($State.CurrentRoom)".RoomDescription)"

    # Write exits to screen.
    Show-Exits

    # Take inventory of all the sodas in the vending machine.
    $Sodas = @{}
    $i = 1
    foreach ($Soda in $InteractableData.Keys) {
        $Sodas.$i = $InteractableData.$Soda
        $i++
    }

    # Write interactable specific actions to screen
    $i = 1
    Write-WordWrapHost "You stand in front of a soda vending machine. There's a lot of choice and it is free of charge. Take your pick!" -Color Magenta
    Write-Host

    foreach ($Choice in $Sodas.Keys | Sort-Object) {
        Write-Host "$i`: $($Sodas.$Choice.MenuDescription)"
        $i++
    }
    Write-Host

    # Read player action.
    $PlayerInput = Read-Host "What soda would you like? Enter 0 to leave."

    # Process player action
    if ((@(1..9) -contains $PlayerInput -and $PlayerInput -le $Sodas.Count)) {
        # Add the chosen soda to inventory, if there isn't a drink in the inventory already.
        if ($State.Drink -eq $true) {
            $Script:ActionMessage = "You already have a drink with you. Don't you think that's enough? You step back from the machine."
        }
        else {
            $ChosenSoda = $Sodas.$([int]$PlayerInput)
            $Script:ActionMessage = $ChosenSoda.ActionMessage
            $State.Inventory += $ChosenSoda.InventoryName
            $State.Drink = $true
            $ChosenSoda = $null
        }
        $Script:MachineState = "Completed"
    }
    elseif ($PlayerInput -eq 0) {
        $Script:ActionMessage = "You decide not to take a soda with you and you step back from the machine."
        $Script:MachineState = "Completed"
    }
    else {
        $Script:ActionMessage = "Invalid choice. Try again"
        $Script:MachineState = "Running"
    }
}
