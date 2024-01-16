function Invoke-SodaMachine {
    <#
    .SYNOPSIS
        Starts the interactable Soda Machine.
        
    .DESCRIPTION
        Starts the interactable Soda Machine. It presents the player with a menu, in which they can
        select a certain sode can. Once selected, the can goes into the inventory.
    #>

    # Import machine data from file.
    $Data = Get-Content "$PSScriptRoot\Games\$Game\Interactables\SodaMachine.json" | ConvertFrom-Json -AsHashtable
    <# DEV CODE
    $Data = Get-Content "C:\git\PowerSpel2\Games\Tutorial\Interactables\SodaMachine.json" | ConvertFrom-Json -AsHashtable
    #>
    
    $Data.keys
    $i = 1

    Write-WordWrapHost "You stand in front of a soda vending machine. There's a lot of choice and it is free of charge. Take your pick!"
    Write-Host

    foreach ($Choice in $Data.Keys) {
        Write-Host "$i`: $($Data.$Choice.MachineChoice)"
        $i++
    }

    # Write header to screen.
    Show-Header
    Write-Host

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

    # Write room items to screen.
    foreach ($Item in $Items.Keys) {
        Write-Host $Items.$Item.ItemDescription -ForegroundColor Cyan
    }
    Write-Host
    
    # Read player action.
    $PlayerInput = Read-Host "What would you like to do?"

    if (0..9 -contains $PlayerInput) {
        Write-Host "You chose something" -ForegroundColor Cyan

    } else {
        Write-Host "Invalid choice. Try again"
        exit
    }

    Pause

}