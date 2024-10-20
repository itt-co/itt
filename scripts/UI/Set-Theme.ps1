function ToggleTheme {

    <#
        .SYNOPSIS
        Toggles the application's theme between dark and light modes based on the state of the `themeText` checkbox control.

        .DESCRIPTION
        The `ToggleTheme` function checks the state of a UI checkbox named `themeText` to determine whether the application should be switched to dark or light mode. 
        If the checkbox is checked, the function activates dark mode; if unchecked, it activates light mode. 
        The checkbox state is then updated to reflect the new theme setting. Error handling is included to manage and report any issues that occur during the theme switching process.
    #>
    
    try {

        if ($itt.searchInput = $itt['window'].FindName('themeText').IsChecked -eq $true)
        {
            Switch-ToDarkMode
        } 
        else
        {
            Switch-ToLightMode
        }
        
    }
    catch {
        Write-Host "Error toggling theme: $_"
    }

    $itt['window'].FindName('themeText').IsChecked = -not $itt['window'].FindName('themeText').IsChecked

}
function Switch-ToDarkMode {
    try {

        $theme = $itt['window'].FindResource("Dark")
        Update-Theme $theme "true"
    } catch {
        Write-Host "Error switching to dark mode: $_"
    }
}
function Switch-ToLightMode {
    try {
        $theme = $itt['window'].FindResource("Light")
        Update-Theme $theme "Light"
    } catch {
        Write-Host "Error switching to light mode: $_"
    }
}
function Update-Theme ($theme) {
    $itt['window'].Resources.MergedDictionaries.Clear()
    $itt['window'].Resources.MergedDictionaries.Add($theme)
    Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "$theme" -Force

}
function SwitchToSystem {

    try {

        Set-ItemProperty -Path $itt.registryPath  -Name "Theme" -Value "default" -Force

        $AppsTheme = (Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme")

        switch ($AppsTheme) {
            "0" {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            }
            "1" {
                $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            }
            Default {
                Write-Host "Unknown theme value: $AppsTheme"
            }
        }
    }
    catch {
        Write-Host "Error occurred: $_"
    }
}

function Set-Theme {
    param (
        [string]$Theme
    )

    Switch($Theme)
    {
        "Light"{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Light" -Force
        }
        "Dark"{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Dark" -Force
        }
        default{
            $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("$Theme"))
            Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "Custom" -Force
            Set-ItemProperty -Path $itt.registryPath -Name "UserTheme" -Value "$Theme" -Force
        }
    }
}