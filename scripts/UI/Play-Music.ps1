function Manage-Music {

    <#
        .SYNOPSIS
        Manages music playback, volume, and related resources in the Install Tweaks Tool.

        .DESCRIPTION
        This function allows you to control the music volume, stop music playback, and clean up resources.
        It supports setting the volume, stopping music, and stopping all runspaces and processes.
    #>

    param([string]$action, [int]$volume = 0)

    switch ($action) {
        "SetVolume" {
            $itt.mediaPlayer.settings.volume = $volume
            $global:toggleState = ($volume -ne 0)
            Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$volume" -Force
            $itt["window"].title = "Install Tweaks Tool #StandWithPalestine " + @("🔊", "🔈")[$volume -eq 0]
        }
        "StopAll" {
            $itt.mediaPlayer.controls.stop(); $itt.mediaPlayer = $null
            $itt.runspace.Dispose(); $itt.runspace.Close()
            $script:powershell.Dispose(); $script:powershell.Stop()
            $newProcess.exit; [System.GC]::Collect()
        }
        default { Write-Host "Invalid action. Use 'SetVolume' or 'StopAll'." }
    }
}