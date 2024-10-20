# Mute the music by setting the volume to the specified value
function MuteMusic {

    <#
        .SYNOPSIS
        Adjusts the volume of the media player and saves the setting for persistence.

        .DESCRIPTION
        The `MuteMusic` function sets the volume of the media player to a specified level and saves this volume setting to the registry. 
        This ensures that the volume level is persisted even after restarting the application or the system. 
        The function also updates the window's title to indicate the current state.

        .PARAMETER value
        The volume level to set. It should be an integer value between 0 (muted) and 100 (full volume). The function uses this value to adjust the media player's volume and to store the setting in the registry.

        .EXAMPLE
        MuteMusic -value 0
        Sets the media player's volume to 0 (muted) and updates the window title to indicate the volume level.

        .EXAMPLE
        MuteMusic -value 50
        Sets the media player's volume to 50% and updates the window title to indicate the current volume level.

        .NOTES
        - The volume value should be an integer between 0 and 100.
        - The volume setting is saved to the registry at the path specified by `$itt.registryPath` under the "Music" key.
        - Ensure that `$itt.mediaPlayer.settings.volume` and `$itt.registryPath` are properly initialized in your environment.
    #>

    param($value)
    $itt.mediaPlayer.settings.volume = $value
    # Save the volume setting to the registry for persistence
    Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$value" -Force
    $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔈"

}

# Unmute the music by setting the volume to the specified value
function UnmuteMusic {
    param($value)
    $itt.mediaPlayer.settings.volume = $value
    # Save the volume setting to the registry for persistence
    Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$value" -Force
    $itt["window"].title = "Install Tweaks Tool #StandWithPalestine 🔊"

}

# Stop the music and clean up resources
function StopMusic {
    $itt.mediaPlayer.controls.stop()    # Stop the media player
    $itt.mediaPlayer = $null            # Clear the media player object
    $script:powershell.Dispose()         # Dispose of the PowerShell object
    $itt.runspace.Dispose()             # Dispose of the runspace
    $itt.runspace.Close()               # Close the runspace
}

# Stop all runspaces, stop the music, and exit the process
function StopAllRunspace {
    $script:powershell.Dispose()         # Dispose of the PowerShell object
    $itt.runspace.Dispose()             # Dispose of the runspace
    $itt.runspace.Close()               # Close the runspace
    $script:powershell.Stop()            # Stop the PowerShell script
    StopMusic                            # Stop the music and clean up resources
    $newProcess.exit                     # Exit the process
}