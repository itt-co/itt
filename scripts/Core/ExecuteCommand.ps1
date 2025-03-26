function ExecuteCommand {

    <#
        .SYNOPSIS
        Executes a PowerShell command in a new process.
        .DESCRIPTION
        This function starts a new PowerShell process to execute the specified command.
        .EXAMPLE
        ExecuteCommand -Name "Greeting" -Command "Write-Output 'Welcome to ITT'"
        Executes the PowerShell command `Write-Output 'Welcome to ITT'` in a new PowerShell process.
    #>

    param ([array]$tweak)

    try {
        foreach ($cmd in $tweak) {
            Add-Log -Message "Please wait..."
            $script = [scriptblock]::Create($cmd)
            Invoke-Command  $script -ErrorAction Stop
        }
    } catch  {
        Add-Log -Message "The specified command was not found." -Level "WARNING"
    }
}