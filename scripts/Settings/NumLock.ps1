function Invoke-NumLock {

    <#
        .SYNOPSIS
        Toggles the Num Lock state on the system by modifying registry settings.

        .DESCRIPTION
        The `Invoke-NumLock` function sets the state of the Num Lock key based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, Num Lock is enabled.
        - If `$Enabled` is `$false`, Num Lock is disabled.
        The function modifies the registry settings under `HKU\.Default\Control Panel\Keyboard` to achieve this.

        .PARAMETER Enabled
        A boolean value that determines whether Num Lock should be enabled (`$true`) or disabled (`$false`).

        .EXAMPLE
        Invoke-NumLock -Enabled $true
        This example enables Num Lock.

        .EXAMPLE
        Invoke-NumLock -Enabled $false
        This example disables Num Lock.

        .NOTES
        - Requires administrative privileges to modify registry settings.
        - The registry path used is for the default user profile and may not affect the currently logged-in user.
    #>

    param(
        [Parameter(Mandatory = $true)]
        [bool]$Enabled
    )

    try {
        if ($Enabled -eq $false)
        { 
            Add-Log -Message "Numlock Enabled" -Level "Apply"
            $value = 2 
        } 
        else
        { 
            Add-Log -Message "Numlock Disabled" -Level "Disabled"
             $value = 0
        }

        New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS -ErrorAction Stop
        $Path = "HKU:\.Default\Control Panel\Keyboard"
        $Path2 = "HKCU:\Control Panel\Keyboard"
        Set-ItemProperty -Path $Path -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
        Set-ItemProperty -Path $Path2 -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
    }
    catch {
        Write-Warning "An error occurred: $($_.Exception.Message)"
    }
}
