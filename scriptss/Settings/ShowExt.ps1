function Invoke-ShowFile-Extensions {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.

        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.

        .PARAMETER Enabled
        A boolean value that determines whether file extensions should be shown (`$true`) or hidden (`$false`).

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $true
        This example makes file extensions visible in Windows Explorer.

        .EXAMPLE
            Invoke-ShowFile-Extensions -Enabled $false
        This example hides file extensions in Windows Explorer.

        .NOTES
        - The function requires restarting Windows Explorer to apply the changes.
        - Administrative privileges might be required depending on system configuration.
    #>
   
    Param($Enabled)
    Try{
        if ($Enabled -eq $false){
            $value = 0
            Add-Log -Message "Hidden extensions" -Level "Apply"
        }
        else {
            $value = 1
            Add-Log -Message "Hidden extensions" -Level "Disabled"
        }
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Set-ItemProperty -Path $Path -Name HideFileExt -Value $value
        Refresh-Explorer
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