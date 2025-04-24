function Invoke-DisableAutoDrivers {
    
    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param(
        $Enabled,
        [string]$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching",
        [string]$name = "SearchOrderConfig"
    )
        Try{
            if ($Enabled -eq $false){
                $value = 1
                Add-Log -Message "Enabled auto drivers update" -Level "info"
            }
            else {
                $value = 0
                Add-Log -Message "Disabled auto drivers update" -Level "info"
            }
        Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
        }
        Catch [System.Security.SecurityException] {
            Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
        }
        Catch [System.Management.Automation.ItemNotFoundException] {
            Write-Warning $psitem.Exception.ErrorRecord
        }
        Catch{
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $psitem.Exception.StackTrace
        }
}