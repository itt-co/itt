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

        if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}

        $tweak | ForEach-Object {

            if($_.Value -ne "Remove")
            {

                If (!(Test-Path $_.Path)) {
                    Add-Log -Message "$($_.Path) was not found, Creating..." -Level "info"
                    New-Item -Path $_.Path | Out-Null   
                }

                Add-Log -Message "Optmize $($_.name)..." -Level "info"
                New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null     

            }else
            {
                if($_.Name -ne $null)
                {
                    # Remove the specific registry value
                    Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
                    Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue

                }else{
                    # remove the registry path
                    Add-Log -Message "Remove $($_.Path)..." -Level "info"
                    Remove-Item -Path $_.Path -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

    } catch {
        Write-Error "An error occurred: $_"
    }
}