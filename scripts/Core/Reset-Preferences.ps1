function Reset-Preferences {

    <#
        .SYNOPSIS
        Resets user preferences for music volume and popup window settings.
    #>

    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value 0 -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value 100 -Force
    Set-ItemProperty -Path $itt.registryPath  -Name "UserTheme" -Value "none" -Force
    SwitchToSystem
    Message -key "Reopen_itt_again" -icon "Information" -action "OK"
}