function Invoke-ShowFile-Icons {

    <#
        .SYNOPSIS
        Toggles the visibility of thmbnails in Windows Explorer.
    #>

    param ($Enabled, $Name = "IconsOnly", $Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")

    Try {
        if ($Enabled -eq $false) {
            $value = 1
            Add-Log -Message "ON" -Level "info"
        }
        else {
            $value = 0
            Add-Log -Message "OFF" -Level "info"
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