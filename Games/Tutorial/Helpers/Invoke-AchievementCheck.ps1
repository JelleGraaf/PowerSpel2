function Invoke-AchievementCheck {
    <#
    .SYNOPSIS
        Checks for conditions of all achievements and completes them if they meet the requirements.
    #>

    # Check for completed achievements.
    ## Completer of achievements
    if ($State.CurrentRoom -eq 535050) {
        $AchievementName = "Completer of achievements"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

    ## Keymaster
    if ($State.Inventory -contains 'A simple key' -and $State.Inventory -contains 'A key card' -and $State.CurrentRoom -eq 524850) {
        $AchievementName = "Keymaster"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

    ## Can you?
    if ($State.Drink -eq $true) {
        $AchievementName = "Can you?"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

    ## Tutorial master
    if ($State.CurrentRoom -eq 504950) {
        $AchievementName = "Tutorial master"
        if ($GameAchievements.Keys -contains $AchievementName) {
            Invoke-CompleteAchievement -AchievementName $AchievementName
        }
    }

}
