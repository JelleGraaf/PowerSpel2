function Invoke-AchievementCheck {
    <#
    .SYNOPSIS
        Checks for conditions of all achievements and completes them if they meet the requirements.
    #>

    # Check for completed achievements.
    ## Collector
    if ($State.Inventory -contains "A pen" -and $State.Inventory -contains "A mug") {
        $AchievementName = "Collector"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

    ## Attic explorer
    if ($State.CurrentRoom -eq 505001) {
        $AchievementName = "Attic explorer"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }
}
