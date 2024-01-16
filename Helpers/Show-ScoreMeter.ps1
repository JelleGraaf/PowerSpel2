function Show-ScoreMeter { 
    <#
    .SYNOPSIS
        Shows a graphic percentile representation of the specified score.
    
    .DESCRIPTION
        Shows a meter with the specified score, in increments of 10 percent.

    .PARAMETER ScoreName
        The name of the displayed meter / score. Maximum length is 40 characters, otherwise the visual gets messed up.

    .PARAMETER ScoreValue
        The absolute number of the score.

    .PARAMETER ScoreMaxValue
        The highest possible number that the score could have reached.
    #>
    Param(
        $ScoreName,
        $ScoreValue,
        $ScoreMaxValue
    )

    # Calculate the score percentage (on a scale from 1 to 10) and round it down to the nearest whole number.
    $ScorePercentageRoundedDown = [Math]::Floor(10/$ScoreMaxValue*$ScoreValue)

    # Show a meter with green asterisks depicting the percentage completed of the specified score.
    Write-Host $ScoreName.padright(42) -NoNewline
    Write-Host "[" -NoNewline
    for ($i = 1; $i -le 10; $i++) {
        Start-Sleep -m 100
        if ($i -le $ScorePercentageRoundedDown) {
            Write-Host "*" -NoNewline -ForegroundColor Green
        }
        else {
            Write-Host "-" -NoNewline
        }
    }
    Write-Host "]  $ScoreValue/$ScoreMaxValue" 
}
