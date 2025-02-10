function Invoke-Toggle {

    <#
        .SYNOPSIS
        Toggles various system settings based on the provided debug parameter.

        .DESCRIPTION
        The `Invoke-Toggle` function dynamically toggles system settings such as dark mode, file extensions visibility, 
        and performance options. It determines the appropriate action based on the input parameter and executes 
        the corresponding function.

        .EXAMPLE
        Invoke-Toggle -Debug "darkmode"
        Toggles the system's dark mode setting.
    #>

    Param ([string]$Debug)

    $toggleActions = @{
        "showfileextensions" = "Invoke-ShowFile-Extensions"; "darkmode" = "Invoke-DarkMode"
        "showsuperhidden" = "Invoke-ShowFile"; "numlock" = "Invoke-NumLock"
        "stickykeys" = "Invoke-StickyKeys"; "mouseacceleration" = "Invoke-MouseAcceleration"
        "endtaskontaskbarwindows11" = "Invoke-TaskbarEnd"; "clearpagefileatshutdown" = "Invoke-ClearPageFile"
        "autoendtasks" = "Invoke-AutoEndTasks"; "performanceoptions" = "Invoke-PerformanceOptions"
        "launchtothispc" = "Invoke-LaunchTo"; "disableautomaticdriverinstallation" = "Invoke-DisableAutoDrivers"
    }

    if ($toggleActions[$Debug.ToLower()]) { & $toggleActions[$Debug.ToLower()] $(Get-ToggleStatus $Debug) }
    else { Write-Warning "Invalid toggle: $Debug"; Add-Log -Message "Invalid toggle: $Debug" -Level "warning" }
}