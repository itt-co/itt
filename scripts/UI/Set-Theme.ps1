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
    $itt['window'].Resources.MergedDictionaries.Clear()
    $itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("$Theme"))
    Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "$Theme" -Force
    $itt.Theme = $Theme
}