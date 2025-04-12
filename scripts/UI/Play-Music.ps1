function Manage-Music {

    <#
        .SYNOPSIS
        Manages music playback, volume
    #>

    param([string]$action, [int]$volume = 0)

    switch ($action) {
        "SetVolume" {
            $itt.mediaPlayer.settings.volume = $volume
            $global:toggleState = ($volume -ne 0)
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$volume" -Force
            $itt["window"].title = "Install Tweaks Tool " + @("🔊", "🔈")[$volume -eq 0]
        }
        "StopAll" {
            $itt.mediaPlayer.controls.stop() 
            $itt.mediaPlayer = $null
            $itt.runspace.Dispose()
            $itt.runspace.Close()
            $script:powershell.Dispose()
            $script:powershell.Stop()
            [System.GC]::Collect()
            [System.GC]::WaitForPendingFinalizers()
        }
        default { Write-Host "Invalid action. Use 'SetVolume' or 'StopAll'." }
    }
}