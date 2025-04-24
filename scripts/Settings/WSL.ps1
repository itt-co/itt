function Invoke-WSL {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "WSL2 disabled" -Level "info"
            dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
            dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
        }
        else {
            Add-Log -Message "WSL2 enabled" -Level "info"
            dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
            dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set WSL2 due to a Security Exception"
    }
}