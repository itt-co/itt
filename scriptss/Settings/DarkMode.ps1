Function Invoke-DarkMode {

    <#
        .SYNOPSIS
        Toggles the Windows theme between Dark Mode and Light Mode based on the provided setting.

        .DESCRIPTION
        The `Invoke-DarkMode` function enables or disables Dark Mode for Windows based on the `$DarkModeEnabled` parameter.
        - If `$DarkModeEnabled` is `$true`, it sets the system to Dark Mode.
        - If `$DarkModeEnabled` is `$false`, it sets the system to Light Mode.
        The function updates the application's theme resources accordingly and restarts the Windows Explorer process to apply the changes.

        .PARAMETER DarkModeEnabled
        A boolean value indicating whether Dark Mode should be enabled (`$true`) or Light Mode should be enabled (`$false`).

        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $true
        This example sets the Windows theme to Dark Mode.

        .EXAMPLE
            Invoke-DarkMode -DarkModeEnabled $false
        This example sets the Windows theme to Light Mode.

        .NOTES
        - The function modifies registry settings related to Windows themes.
        - It restarts Windows Explorer to apply the theme changes.
        - Error handling is included for security exceptions and item not found exceptions.
    #>

    Param($DarkMoveEnabled)
    Try{

        $Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme").Theme

        if ($DarkMoveEnabled -eq $false){
            $DarkMoveValue = 0
            Add-Log -Message "Dark Mode" -Level "Apply"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            }
        }
        else {
            $DarkMoveValue = 1
            Add-Log -Message "Light Mode" -Level "Disabled"
            if($Theme -eq "default")
            {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            }
        }

        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $DarkMoveValue
        Set-ItemProperty -Path $Path -Name SystemUsesLightTheme -Value $DarkMoveValue
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}