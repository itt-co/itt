function ExecuteCommand {
    
    <#
    .SYNOPSIS
    Executes a PowerShell command in a new process.

    .DESCRIPTION
    This function starts a new PowerShell process to execute the specified command. It waits for the command to complete before returning control to the caller. The function handles any errors that occur during the execution of the command and outputs an error message if needed.

    .PARAMETER Name
    An optional name or identifier for the command being executed. This parameter is currently not used in the function but could be used for logging or tracking purposes.

    .PARAMETER Command
    The PowerShell command to be executed. This parameter is required.

    .EXAMPLE
    ExecuteCommand -Name "Greeting" -Command "Write-Output 'Welcome to ITT'"
    Executes the PowerShell command `Write-Output 'Welcome to ITT'` in a new PowerShell process.
    #>

    param (
        [string]$Name,
        [array]$Tweak
    )

    try {

        if($debug){ Add-Log -Message $Name $Tweak -Level "debug"}

        if ($tweak -and $tweak.Count -gt 0) {
            
            $Tweak | ForEach-Object { 
                $cmd = [scriptblock]::Create($psitem)
                Invoke-Command  $cmd -ErrorAction Stop
            }
        }
        else
        {
            if($debug){Add-Log -Message "InvokeCommand is empty on this tweak" -Level "debug" }
        }

    } catch [System.Management.Automation.CommandNotFoundException] {
        Write-Warning "The specified command was not found."
        Write-Warning $PSItem.Exception.message
    } catch [System.Management.Automation.RuntimeException] {
        Write-Warning "A runtime exception occurred."
        Write-Warning $PSItem.Exception.message
    } catch [System.Security.SecurityException] {
        Write-Warning "A security exception occurred."
        Write-Warning $PSItem.Exception.message
    } catch [System.UnauthorizedAccessException] {
        Write-Warning "Access denied. You do not have permission to perform this operation."
        Write-Warning $PSItem.Exception.message
    } catch {
        Write-Warning "Unable to run script for $Name due to unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}