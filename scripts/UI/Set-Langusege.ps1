function System-Default {
    try {

        $itt["window"].DataContext = $itt.database.locales.Controls.$shortCulture
        
        if (-not $itt["window"].DataContext -or [string]::IsNullOrWhiteSpace($itt["window"].DataContext)) {
            Add-Log -Message "This language ($shortCulture) is not supported yet, fallback to English" -Level "Info"
            $itt["window"].DataContext = $itt.database.locales.Controls.en
            Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "default" -Force
        }
        else {
            $itt["window"].DataContext = $itt.database.locales.Controls.$shortCulture
            Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "default" -Force
        }
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}


function Set-Language {
    param (
        [string]$lang
    )
    if ($lang -eq "default") {
        System-Default
    }
    else {
        # Set registry value for the language
        $itt.Language = $lang
        Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "$lang" -Force
        $itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)
    }
}