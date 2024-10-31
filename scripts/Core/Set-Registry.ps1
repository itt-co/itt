function Set-Registry {
    <#
        .SYNOPSIS
        Sets or creates a registry value at a specified path.

        .DESCRIPTION
        This function sets a registry value at a given path. If the specified registry path does not exist, the function attempts to create the path and set the value. It handles different registry value types and includes error handling to manage potential issues during the process.

        .PARAMETER Name
        The name of the registry value to set or create. This parameter is required.

        .PARAMETER Type
        The type of the registry value. Common types include `String`, `DWord`, `QWord`, etc. This parameter is required.

        .PARAMETER Path
        The full path of the registry key where the value is to be set. This parameter is required.

        .PARAMETER Value
        The value to be set for the registry key. This parameter is required.

        .EXAMPLE
        Set-Registry -Name "EnableFeeds" -Type "DWord" -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Value 0
        Sets the registry value named "EnableFeeds" to 0 (DWORD) under "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds". If the path does not exist, it attempts to create it.
    #>

    param (
        [array]$tweak
    )
    
    try {

        foreach ($reg in $tweak) {

            if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}
    
            Add-Log -Message "Optmize $($reg.name)..." -Level "info"

            if($reg.Value -ne "Remove")
            {
                If (!(Test-Path $Path)) {
                    if($debug){Add-Log -Message "$($reg.Path) Path was not found, Creating..." -Level "info"}
                    New-Item -Path $reg.Path -Force -ErrorAction Stop | Out-Null
                }

                Set-ItemProperty -Path $reg.Path -Name $reg.Name -Type $reg.Type -Value $reg.Value -Force -ErrorAction Stop | Out-Null
            }
            else
            {
                if($reg.Name -ne $null)
                {
                    # Remove the specific registry value
                    Remove-ItemProperty -Path $reg.Path -Name $reg.Name -Force -ErrorAction SilentlyContinue

                }else{
                    # remove the registry path
                    Remove-Item -Path $reg.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

    } catch {
        Write-Error "An error occurred: $_"
    }
}