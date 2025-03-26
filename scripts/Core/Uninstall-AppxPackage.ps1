function Uninstall-AppxPackage {

    <#
        .SYNOPSIS
        Uninstalls an AppX package and removes any provisioned package references.
        .DESCRIPTION
        This function uninstalls a specified AppX package.
        .EXAMPLE
        Uninstall-AppxPackage -Name "Microsoft.BingNews"
    #>

    param ([array]$tweak)
    
    try {
        foreach ($name in $tweak) {
            Add-Log -Message "Removing $name..." -Level "info"
            Get-AppxPackage "*$name*" | Remove-AppxPackage -ErrorAction SilentlyContinue
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        }
    } 
    catch 
    {
        Add-Log -Message "PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL $NAME." -Level "WARNING"
    }
}