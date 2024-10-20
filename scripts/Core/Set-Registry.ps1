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
        Set-Registry -Name "ExampleValue" -Type "String" -Path "HKCU\Software\MyCompany" -Value "ExampleData"
        Sets the registry value named "ExampleValue" to "ExampleData" under "HKCU\Software\MyCompany". If the path does not exist, it attempts to create it.
    #>

    param (
        $Name,
        $Type,
        $Path,
        $Value
    )
    
    try
    {
        # Check if the registry path exists
        if (-not (Test-Path -Path $Path)) {
            Write-Output "Registry path does not exist. Creating it..."
            # Try to create the registry path
            try {
                New-Item -Path $Path -Name $Name -Type $Type -Value $Value -Force -ErrorAction Stop | Out-Null
                #Add-Log -Message "Registry path created successfully." -Level "INFO"
            } catch {
                Add-Log -Message "Failed to create registry path: $_" -Level "ERROR"
            }
        } else {
            Set-ItemProperty -Path $Path -Name $Name -Type $Type -Value $Value -Force -ErrorAction Stop
        }
    }

    catch {
        Write-Error "An error occurred: $_"
    }
}