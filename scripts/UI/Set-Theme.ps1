function SwitchToSystem {

    <#
        .SYNOPSIS
        Functions to manage application theme settings.

        .DESCRIPTION
        SwitchToSystem resets the theme to the system default and applies the appropriate resource.
        Set-Theme applies a user-defined theme and updates the registry accordingly.
    #>

    try {
        $appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
        $theme = if ($AppsTheme -eq "0") { "Dark" } elseif ($AppsTheme -eq "1") { "Light" } else { Write-Host "Unknown theme: $AppsTheme"; return }
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($theme))
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
        $itt.Theme = $Theme
    }
    catch { Write-Host "Error: $_" }
}

function Set-Theme {
    param ([string]$Theme)
    try {
        $itt['window'].Resources.MergedDictionaries.Clear()
        $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($Theme))
        Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value $Theme -Force
        $itt.Theme = $Theme
    }
    catch { Write-Host "Error: $_" }
}