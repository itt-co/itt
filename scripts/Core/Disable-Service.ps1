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
        $Name,
        $StartupType
    )

    try {

        if($debug){ Add-Log -Message $Name $StartupType -Level "debug"}

        Add-Log -Message "Set Service $Name to $StartupType" -Level "info"

        # Check first
        $service = Get-Service -Name $Name -ErrorAction Stop

        # Service exists, proceed with changing properties
        $service | Set-Service -StartupType $StartupType -ErrorAction Stop
        Stop-Service -Name $Name -ErrorAction Stop
    } catch [System.ServiceProcess.ServiceNotFoundException] {
        Write-Warning "Service $Name was not found"
    } catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $_.Exception.Message
    }
}