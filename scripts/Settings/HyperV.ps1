function Invoke-HyperV {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "Enabling HyperV..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"Microsoft-Hyper-V-All" /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling HyperV..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"Microsoft-Hyper-V-All" /all /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set HyperV due to a Security Exception"
    }
}