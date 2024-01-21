function Show-Map {
    <#
    .SYNOPSIS
        Wrapper function to display the map in the correct map type.
        
    .DESCRIPTION
        Wrapper function to display the map in the correct map type. It takes the value from $MapStyle and 
        displays the map on screen, with the chosen map type.
    #>

    switch ($MapStyle) {
        'Static'  { Show-MapStatic }
        'Dynamic' { Show-MapDynamic }
        'Compact' { Show-MapCompact } # Future map type
        Default { Write-Error "Map style not recognized" }
    }
        
    
}
