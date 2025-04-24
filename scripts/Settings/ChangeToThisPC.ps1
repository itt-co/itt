function Invoke-LaunchTo {

    <#
        .SYNOPSIS
        Toggles the visibility of hidden files and folders in Windows Explorer.
    #>

    Param(
        $Enabled,
        [string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
        [string]$name = "LaunchTo"
    )
    
    Try{
        if ($Enabled -eq $false){
            $value = 1
            Add-Log -Message "Launch to This PC" -Level "info"
        }
        else {
            $value = 2
            Add-Log -Message "Launch to Quick Access" -Level "info"
        }

        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        
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