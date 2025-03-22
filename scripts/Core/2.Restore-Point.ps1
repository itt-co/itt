function CreateRestorePoint {
    
    try {
        
        Add-Log -Message "Creating Restore point..." -Level "INFO"

        powershell.exe -Command {

            $Date = Get-Date -Format "yyyyMMdd-hhmmss-tt"
            $RestorePointName = "ITT-$Date"
            Enable-ComputerRestore -Drive $env:SystemDrive
            Checkpoint-Computer -Description $RestorePointName -RestorePointType "MODIFY_SETTINGS"
            Set-ItemProperty -Path $itt.registryPath  -Name "backup" -Value 1 -Force
            exit
        }

        Add-Log -Message "Created successfully" -Level "INFO"

    }
    catch {
        Add-Log -Message "Error: $_" -Level "ERROR"
    }
}