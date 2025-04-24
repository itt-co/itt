function Invoke-HyperV {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
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