function CreateRestorePoint {

    <#
        .SYNOPSIS
        Create Restore Point
    #>

    try {
        Set-Statusbar -Text "✋ Please wait Creating a restore point..."
        Set-ItemProperty "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" "SystemRestorePointCreationFrequency" 0 -Type DWord -Force
        powershell.exe -NoProfile -Command {
            Enable-ComputerRestore -Drive $env:SystemDrive
            Checkpoint-Computer -Description ("ITT-" + (Get-Date -Format "yyyyMMdd-hhmmss-tt")) -RestorePointType "MODIFY_SETTINGS"
        }
        Set-ItemProperty $itt.registryPath "backup" 1 -Force
        Set-Statusbar -Text "✔ Created successfully. Applying tweaks..."
    } catch {
        Add-Log "Error: $_" "ERROR"
    }
}