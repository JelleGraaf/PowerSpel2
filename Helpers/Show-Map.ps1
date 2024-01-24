function Show-Map {
    <#
    .SYNOPSIS
        Wrapper function to display the map in the correct map type.
        
    .DESCRIPTION
        Wrapper function to display the map in the correct map type. It takes the value from $MapStyle and 
        displays the map on screen, with the chosen map type.
    #>

    param(
        $MapStyle
    )

    switch ($MapStyle) {
        'Dynamic' { Show-MapDynamic }
        'Static'  { Show-MapStatic }
        'Off'     { } # Do nothing here, the map is off.
        Default   { Write-Error "Map style not recognized" }
    }
        
    
}
