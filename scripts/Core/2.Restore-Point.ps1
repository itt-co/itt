function CreateRestorePoint {
    
    try {
        
        Add-Log -Message "Creating Restore point..." -Level "INFO"

        Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 0 -Type DWord -Force

        powershell.exe -Command {

            $Date = Get-Date -Format "yyyyMMdd-hhmmss-tt"
            $RestorePointName = "ITT-$Date"
            Enable-ComputerRestore -Drive $env:SystemDrive
            Checkpoint-Computer -Description $RestorePointName -RestorePointType "MODIFY_SETTINGS"
            exit
        }

        Set-ItemProperty -Path $itt.registryPath  -Name "backup" -Value 1 -Force
        Add-Log -Message "Created successfully" -Level "INFO"

    }
    catch {
        Add-Log -Message "Error: $_" -Level "ERROR"
    }
}