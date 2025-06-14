function Invoke-WindowsSandbox {

    <#
        .SYNOPSIS
        Toggles the visibility of file extensions in Windows Explorer.
    #>

    Param($Enabled)

    Try{
        
        if ($Enabled -eq $false){

            Add-Log -Message "Enabling Windows Sandbox..." -Level "info"
            Start-Process powershell -ArgumentList 'Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All /NoRestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
        else {
            Add-Log -Message "Disabling Windows Sandbox..." -Level "info"
            Start-Process powershell -ArgumentList 'Dism /online /Disable-Feature /FeatureName:"Containers-DisposableClientVM"  /NoRestart' -Verb RunAs
            Add-Log -Message "Restart required" -Level "info"
        }
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set Windows Sandbox due to a Security Exception"
    }
}