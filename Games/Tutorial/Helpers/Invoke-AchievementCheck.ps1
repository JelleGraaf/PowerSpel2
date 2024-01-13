function Invoke-AchievementCheck {
    <#
    .SYNOPSIS
        Checks for conditions of all achievements and completes them if they meet the requirements.
    #>

    # Check for completed achievements.
    ## First move
    if ($State.CurrentRoom -eq 515000) {
        $AchievementName = "First Move"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

}
