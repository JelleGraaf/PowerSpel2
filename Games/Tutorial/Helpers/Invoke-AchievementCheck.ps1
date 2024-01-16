function Invoke-AchievementCheck {
    <#
    .SYNOPSIS
        Checks for conditions of all achievements and completes them if they meet the requirements.
    #>

    # Check for completed achievements.
    ## First move
    if ($State.CurrentRoom -eq 535050) {
        $AchievementName = "Completer of achievements"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

}
