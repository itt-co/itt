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

    param([array]$tweak)

    foreach ($serv in $tweak) {
        try {
            Add-Log  -Message "Setting Service $($serv.Name)" -Level "info"
            $service = Get-Service -Name $serv.Name -ErrorAction Stop
            Stop-Service -Name $serv.Name -ErrorAction Stop
            $service | Set-Service -StartupType $serv.StartupType -ErrorAction Stop
        }
        catch {
            Add-Log -Message "Service $Name was not found" -Level "info"
        }
    }
}