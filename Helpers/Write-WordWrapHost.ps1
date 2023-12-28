Function Write-WordWrapHost {
    <#
    .SYNOPSIS
        Writes text to screen, making sure that words aren't cut off at the end of the line.

    .PARAMETER Textblock
        The text you want written to screen.

    .PARAMETER Color
        The color of the text (same options as the Write-Host cmdlet). Defaults to white.

    .PARAMETER Width
        The width of the screen in characters, at which point to end the current line and start on the next one. Defaults to 128 characters.

    .EXAMPLE
        ps> Write-WordWrapHost -Textblock "This is the text you want to write to screen" -Color Green -Width 100
    #>

    param(
        [parameter(mandatory = $true)]
        [string]$Textblock,

        [parameter(mandatory = $false)]
        [string]$Color = "white",

        [parameter(mandatory = $false)]
        [int]$Width = 128
    )
    
    # Define variables  
    [array]$TextArray = $TextBlock -split " " 
    $LineLength = 0
    
    # Write each word in the array to screen, checking if it fits on current line. If not, write to next line.
    ForEach ($Word in $TextArray) {
        if ($Word.Length -le ($Width - $LineLength)) {
            Write-Host "$Word " -nonewline -ForegroundColor $Color
            $LineLength += $Word.Length + 1 # Add the extra 1 to account for the space that will be added to the word.
        }
        else {
            Write-host ""
            Write-Host "$Word " -NoNewline -ForegroundColor $Color
            $LineLength = 0 + $Word.Length
        }

    }
    
    Write-Host 
}
