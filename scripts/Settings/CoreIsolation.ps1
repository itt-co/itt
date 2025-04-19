function Invoke-Core-Isolation {

    <#
        .SYNOPSIS
        Toggles the visibility of thmbnails in Windows Explorer.
    #>

    param ($Enabled, $Name = "Enabled", $Path = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard")

    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "This change require a restart" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "This change require a restart" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name $Name -Value $value -ErrorAction Stop
        Refresh-Explorer
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $psitem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}