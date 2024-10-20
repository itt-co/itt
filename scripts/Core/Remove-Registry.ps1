function Remove-Registry {

    <#
        .SYNOPSIS
        Deletes a specified registry key and all its subkeys.

        .DESCRIPTION
        This function removes a registry key and its associated subkeys from the Windows registry. It combines the provided registry path and folder name to form the full registry key path and deletes it if it exists. The function includes error handling to manage any issues that occur during the deletion process.

        .PARAMETER RegistryPath
        The base path of the registry where the key is located. This parameter is mandatory.

        .PARAMETER Folder
        The name of the registry key (folder) to be deleted. This parameter is mandatory.

        .EXAMPLE
        Remove-Registry -RegistryPath "HKCU\Software\MyCompany" -Folder "MyApp"
        Deletes the registry key "MyApp" located under "HKCU\Software\MyCompany" and all of its subkeys.
    #>

    param (
        [Parameter(Mandatory=$true)]
        [string]$RegistryPath,
        [Parameter(Mandatory=$true)]
        [string]$Folder
    )

    try {
        # Combine the registry path and folder to create the full registry key path
        $KeyPath = "$RegistryPath\\$Folder"

        # Check if the registry key exists
        if (Test-Path "Registry::$KeyPath") {
            # Delete the registry key and all subkeys recursively
            Remove-Item -Path "Registry::$KeyPath" -Recurse -Force
        } else {
            Add-Log -Message "Registry key '$KeyPath' does not exist." -Level "INFO"
        }
    }
    catch {
        Write-Host "An error occurred: $_" -ForegroundColor red
    }
}