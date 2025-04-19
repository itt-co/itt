function Invoke-ClearPageFile {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param(
        $Enabled,
        [string]$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management",
        [string]$name = "ClearPageFileAtShutdown"
    )
    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "Show End Task on taskbar" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "Disable End Task on taskbar" -Level "info"
        }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
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