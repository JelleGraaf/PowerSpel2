function Show-Header {
    <#
    .SYNOPSIS
        Writes a formatted table with relevant game data to screen.
    
    .DESCRIPTION
        Writes a formatted table with relevant game data to screen. It takes data from the $State object and places is in an aligned table.
    #>

    Clear-Host
    
    # Write the top of the header.
    Write-Host "**********************************************************************************************************************************"
    Write-Host "* Inventory                                                     * Achievements                                                   *"
    Write-Host "**********************************************************************************************************************************"
    
    # Write the middle of the header.
    for ($i = 0; $i -lt $HeaderHeight; $i++) {
        Write-Host "* " -NoNewline 
        Write-Host "$($State.Inventory[$i])".padright(62) -ForegroundColor Cyan -NoNewline
        Write-Host "* " -NoNewline
        Write-Host "$($State.Achievements[$i])".padright(63) -ForegroundColor Cyan -NoNewline
        Write-Host "*"
    }

    # Write the bottom of the header.
    Write-Host "**********************************************************************************************************************************"
    Write-Host
}