function Invoke-CompleteAchievement {
    <#
    .SYNOPSIS
        Completes the given achievement.

    .DESCRIPTION
        Completes the given achievement by adding doing the following:
        - Add the achievement to the State, so it can be displayed in the header.
        - Fill CompletedAchievement with the achievement, so it can be written to screen as an action.
        - Remove the achievement from the game achievements list.

    .PARAMETER AchievementName
        The achievement to complete.

    .EXAMPLE
        ps> Invoke-CompleteAchievement -Achievement "Collector"
    #>

    param(
        [parameter(mandatory = $true)]
        $AchievementName
    )

    if ($State.Achievements -notcontains $AchievementName) {
        $State.Achievements += $AchievementName
        $Script:CompletedAchievement = $AchievementName
        $GameAchievements.Remove($AchievementName)
    }
}
