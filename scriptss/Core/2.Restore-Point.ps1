function RestorePoint {

    <#
        .SYNOPSIS
        Creates a system restore point on the local computer.

        .DESCRIPTION
        This function creates a system restore point using the Checkpoint-Computer cmdlet. It logs the process of creating the restore point and handles any errors that occur during the creation. If the restore point creation fails, an error message is displayed.

        .EXAMPLE
        RestorePoint
        Creates a restore point and logs the success or failure of the operation.
    #>

    Invoke-ScriptBlock -ScriptBlock {

        Try {
            Add-Log -Message "Creating Restore point..." -Level "INFO"
            Start-Process powershell.exe -ArgumentList "-NoExit", "-Command `"Enable-ComputerRestore -Drive '$env:SystemDrive'; Checkpoint-Computer -Description 'ITT' -RestorePointType 'MODIFY_SETTINGS'; exit`"" -Wait -Verb RunAs
            Add-Log -Message "Created successfully" -Level "INFO"
        } Catch {
            Add-Log -Message "An error occurred while enabling System Restore: $_" -Level "ERROR"
        }
    }
}
