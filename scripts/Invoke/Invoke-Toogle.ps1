function Invoke-Toogle {

    <#
        .SYNOPSIS
        Toggles various system settings based on the specified debug parameter.

        .DESCRIPTION
        The `Invoke-Toogle` function manages system settings such as showing file extensions, toggling dark mode, showing hidden files, and managing keyboard settings. It determines the current state of the setting and invokes the appropriate functions to toggle or apply the changes.

        .PARAMETER debug
        A string specifying the setting to toggle. The value should match one of the predefined toggle names, such as "ToggleShowExt" or "ToggleDarkMode". The function uses this parameter to determine which setting to check and change.

        .EXAMPLE
        Invoke-Toogle -debug "ToggleShowExt"

        .EXAMPLE
        Invoke-Toogle -debug "ToggleDarkMode"

        .NOTES
        - The function uses a `Switch` statement to handle different toggle actions based on the `$debug` parameter.
        - It calls `Get-ToggleStatus` to retrieve the current state of the specified setting and then calls the corresponding function to apply the toggle.
        - The `Invoke-ShowFile-Extensions`, `Invoke-DarkMode`, `Invoke-ShowFile`, `Invoke-NumLock`, and `Invoke-StickyKeys` functions are used to modify the respective settings.
        - The debug parameter is primarily used for testing and development purposes. Uncommenting the `Write-Host` line can provide additional output for debugging.
    #>

    Param ([string]$debug)

    # debug
    #Write-Host $debug

    Switch -Wildcard ($debug){

        "ToggleShowExt" {Invoke-ShowFile-Extensions $(Get-ToggleStatus ToggleShowExt)}
        "ToggleDarkMode" {Invoke-DarkMode $(Get-ToggleStatus ToggleDarkMode)}
        "ToggleShowHidden" {Invoke-ShowFile $(Get-ToggleStatus ToggleShowHidden)}
        "ToggleNumLook" {Invoke-NumLock $(Get-ToggleStatus ToggleNumLook)}
        "ToggleStickyKeys" {Invoke-StickyKeys $(Get-ToggleStatus ToggleStickyKeys)}
        "MouseAcceleration" {Invoke-MouseAcceleration $(Get-ToggleStatus MouseAcceleration)}

    }
}