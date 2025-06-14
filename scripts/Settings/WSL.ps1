function Invoke-WSL {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>
    
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "Enabling WSL2..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"Microsoft-Windows-Subsystem-Linux" /all /norestart' -Verb RunAs
            Start-Process powershell -ArgumentList 'dism.exe /online /enable-feature /featurename:"VirtualMachinePlatform" /all /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling WSL2..." -Level "info"
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"Microsoft-Windows-Subsystem-Linux" /norestart' -Verb RunAs
            Start-Process powershell -ArgumentList 'dism.exe /online /disable-feature /featurename:"VirtualMachinePlatform" /norestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set WSL2 due to a Security Exception"
    }
}