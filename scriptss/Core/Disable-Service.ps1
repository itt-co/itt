function Disable-Service {
    
    <#
    .SYNOPSIS
    Disables a specified service by changing its startup type and stopping it.

    .DESCRIPTION
    This function disables a Windows service by first changing its startup type to the specified value, then stopping the service if it is running. The function logs the outcome of the operation, including whether the service was found and successfully disabled or if an error occurred.

    .PARAMETER ServiceName
    The name of the service to be disabled. This is a required parameter.

    .PARAMETER StartupType
    The desired startup type for the service. Common values include 'Disabled', 'Manual', and 'Automatic'. This is a required parameter.

    .EXAMPLE
    Disable-Service -ServiceName "wuauserv" -StartupType "Disabled"
    #>

    param(
        $ServiceName,
        $StartupType
    )

    try {


        # Check if the service exists
        if (Get-Service -Name $ServiceName -ErrorAction SilentlyContinue) {
            Set-Service -Name $ServiceName -StartupType $StartupType -ErrorAction Stop
            Stop-Service -Name $ServiceName 
            Add-Log -Message "Service '$ServiceName' disabled." -Level "INFO"
        }
        else {
            Add-Log -Message "Service '$ServiceName' not found." -Level "INFO"
        }
    }
    catch
    {
        Write-Host "Failed to disable service '$ServiceName'. Error: $_" -ForegroundColor Red
    }
}