function Invoke-HyperV {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
        .DESCRIPTION
        The `Invoke-ShowFile-Extensions` function updates the Windows registry to show or hide file extensions for known file types in Windows Explorer based on the `$Enabled` parameter.
        - If `$Enabled` is `$true`, file extensions are shown.
        - If `$Enabled` is `$false`, file extensions are hidden.
    #>
    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "HyperV disabled" -Level "info"
            dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
        }
        else {
            Add-Log -Message "HyperV enabled" -Level "info"
            dism.exe /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart
        }
    }

    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set HyperV due to a Security Exception"
    }
}