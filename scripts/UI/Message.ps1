function Message {
    <#
        .SYNOPSIS
            Displays a localized message box to the user with a specified icon.
        .DESCRIPTION
            The `Message` function shows a message box with a localized message based on the provided key and icon type.
            It retrieves the message text from a localization database and displays it using the Windows MessageBox class.
            The icon type determines the visual representation of the message box, which can be "Warning" or "Question".
        .PARAMETER key
            The key used to retrieve the localized message from the `itt.database.locales.Controls` object.
            This key should correspond to a valid entry in the localization database for the current language.
        .EXAMPLE
            Message -key "Welcome" -icon "Warning"
            Displays a message box with the message associated with the "Welcome" key and a warning icon.
        .NOTES
            Ensure that the `itt.database.locales.Controls` object is properly populated with localization data and that the specified keys exist for the current language.
    #>
    
    param([string]$key,[string]$NoneKey,[string]$title = "ITT",[string]$icon,[string]$action)

    $iconMap = @{ info = "Information"; ask = "Question"; warning = "Warning"; default = "Question" }
    $actionMap = @{ YesNo = "YesNo"; OK = "OK"; default = "OK" }
    $icon = if ($iconMap.ContainsKey($icon.ToLower())) { $iconMap[$icon.ToLower()] } else { $iconMap.default }
    $action = if ($actionMap.ContainsKey($action.ToLower())) { $actionMap[$action.ToLower()] } else { $actionMap.default }
    $msg = if ([string]::IsNullOrWhiteSpace($key)) { $NoneKey } else { $itt.database.locales.Controls.$($itt.Language).$key }
    [System.Windows.MessageBox]::Show($msg, $title, [System.Windows.MessageBoxButton]::$action, [System.Windows.MessageBoxImage]::$icon)
}