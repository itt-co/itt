function System-Default {
    
    $fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
    $shortCulture = $fullCulture.Split('-')[0]

    switch($shortCulture)
    {
        
        "ar" { $locale = "ar" }
        "en" { $locale = "en" }
        "fr" { $locale = "fr" }
        "tr" { $locale = "tr" }
        "zh" { $locale = "zh" }
        "ko" { $locale = "ko" }
        "de" { $locale = "de" }
        "ru" { $locale = "ru" }
        "es" { $locale = "es" }
        "ga" { $locale = "ga" }
        default { $locale = "en" }
    }

    Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "default" -Force
    $itt["window"].DataContext = $itt.database.locales.Controls.$locale
    $itt.Language = $locale

}

function Set-Language {

    param (
        [string]$lang
    )

    if($lang -eq "default")
    {
        System-Default
    }
    else
    {
        # Set registry value for the language
        $itt.Language = $lang
        Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "$lang" -Force
        $itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)
    }

}