function Show-Header {
    <#
    .SYNOPSIS
        Writes a formatted table with relevant game data to screen.
    
    .DESCRIPTION
        Writes a formatted table with relevant game data to screen. It takes data from the $State object and places is in an aligned table.
    #>

    Clear-Host
    
    # Top.
    Write-Host "**********************************************************************************************************************************"
    Write-Host "* Inventory                                                     * Achievements                                                   *"
    Write-Host "**********************************************************************************************************************************"
    
    # Line 1.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[0])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[0])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 2.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[1])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[1])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 3.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[2])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[2])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 4.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[3])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[3])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 5.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[4])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[4])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 6.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[5])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[5])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 7.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[6])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[6])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 8.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[7])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[7])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Line 9.
    Write-Host "* " -NoNewline 
    Write-Host "$($State.Inventory[8])".padright(62) -ForegroundColor Cyan -NoNewline
    Write-Host "* " -NoNewline
    Write-Host "$($State.Achievements[8])".padright(63) -ForegroundColor Cyan -NoNewline
    Write-Host "*"

    # Bottom.
    Write-Host "**********************************************************************************************************************************"
    Write-Host
}