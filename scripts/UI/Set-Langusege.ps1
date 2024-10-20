function Set-Language {

    <#
        .SYNOPSIS
        Sets the application's language and updates the registry with the selected language.

        .DESCRIPTION
        The `Set-Language` function updates the application's language settings by changing the `DataContext` of the main window to the specified language. 
        It also saves the selected language to the registry to ensure that the language preference is preserved across sessions.

        .PARAMETER lang
        A string representing the language code to set. This code should correspond to a valid language entry in the application's locale database. For example, "en" for English, "fr" for French, etc.

        .EXAMPLE
        Set-Language -lang "en"
        Sets the application's language to English and updates the registry to reflect this choice.

        .EXAMPLE
        Set-Language -lang "fr"
        Changes the application's language to French and saves this preference in the registry.

        .NOTES
        - Ensure that the specified language code exists in `$itt.database.locales.Controls`.
        - The registry path for saving the language setting is defined by `$itt.registryPath`.
    #>

    param (
        [string]$lang  # Parameter for the language to set
    )

    # Set DataContext of the window to the specified language
    $itt["window"].DataContext = $itt.database.locales.Controls.$($lang)

    # Set registry value for the language
    Set-ItemProperty -Path $itt.registryPath  -Name "locales" -Value "$lang" -Force
}