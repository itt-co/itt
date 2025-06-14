function Invoke-WindowsSandbox {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param($Enabled)

    Try{
        if ($Enabled -eq $false){
            Add-Log -Message "Sandbox disabled" -Level "info"
            Dism /online /Disable-Feature /FeatureName:"Containers-DisposableClientVM"  /NoRestart
        }
        else {
            Add-Log -Message "Sandbox enabled" -Level "info"
            Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All /NoRestart
        }
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set Windows Sandbox due to a Security Exception"
    }
}