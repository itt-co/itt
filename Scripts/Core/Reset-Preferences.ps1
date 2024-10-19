function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.

        .DESCRIPTION
        This function resets the preferences by updating the registry values for the music volume and popup window settings. 
        It writes the provided values to the specified registry path and switches to the system's default settings.

        .PARAMETER music
        Sets the music volume preference. Default is "100".

        .PARAMETER PopupWindow
        Sets the popup window visibility. Default is "on".
    #>

    param (
        [string]$music = "100",
        [string]$PopupWindow = "on",
        [string]$UserTheme = "none"
    )

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value $PopupWindow -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value $music -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "UserTheme" -Value $UserTheme -Force

    SwitchToSystem

    Message -key "reopen" -icon "Information" -action "OK"
}