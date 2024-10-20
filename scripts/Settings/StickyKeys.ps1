Function Invoke-StickyKeys {

     <#
        .SYNOPSIS
        Toggles Sticky Keys functionality in Windows.

        .DESCRIPTION
        The `Invoke-StickyKeys` function updates the Windows registry settings to enable or disable Sticky Keys based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Sticky Keys is enabled with a specific configuration.
        - If `$Enabled` is `$false`, Sticky Keys is disabled with a different configuration.
        - Note: Enabling Sticky Keys may require restarting Windows Explorer.

        .PARAMETER Enabled
        A boolean value that determines whether Sticky Keys should be enabled (`$true`) or disabled (`$false`).

        .EXAMPLE
            Invoke-StickyKeys -Enabled $true
        This example enables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.

        .EXAMPLE
            Invoke-StickyKeys -Enabled $false
        This example disables Sticky Keys with the specified configuration and prompts for a restart of Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>

    Param($Enabled)
    Try {
        if ($Enabled -eq $false){
            $value = 510
            $value2 = 510
            Add-Log -Message "Sticky Keys" -Level "Apply"
        }
        else {
            $value = 58
            $value2 = 122
            Add-Log -Message "Sticky Keys" -Level "Disabled"
        }
        $Path = "HKCU:\Control Panel\Accessibility\StickyKeys"
        $Path2 = "HKCU:\Control Panel\Accessibility\Keyboard Response"
        Set-ItemProperty -Path $Path -Name Flags -Value $value
        Set-ItemProperty -Path $Path2 -Name Flags -Value $value2
        Refresh-Explorer
        Add-Log -Message "This Setting require a restart" -Level "INFO"
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch{
        Write-Warning "Unable to set $Name due to unhandled exception"
    }

}