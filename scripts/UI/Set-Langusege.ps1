function System-Default {

    Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "default" -Force
    $itt["window"].DataContext = $itt.database.locales.Controls.$Locales
    $itt.Language = $Locales
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