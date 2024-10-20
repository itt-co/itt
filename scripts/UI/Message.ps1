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

        .PARAMETER icon
            The type of icon to be displayed in the message box. Valid values are:
            - "Warning" for a warning icon
            - "Question" for a question icon
            - "Information" for Information icon

        .EXAMPLE
            Message -key "Welcome" -icon "Warning"
            Displays a message box with the message associated with the "Welcome" key and a warning icon.

        .EXAMPLE
            Message -key "ConfirmAction" -icon "Question"
            Displays a message box with the message associated with the "ConfirmAction" key and a question icon.

        .NOTES
            Ensure that the `itt.database.locales.Controls` object is properly populated with localization data and that the specified keys exist for the current language.
    #>
    
    param(
        [string]$key,
        [string]$NoneKey,
        [string]$icon,
        [string]$action
    )
    
    # Use switch to determine the correct MessageBoxImage
    switch ($icon.ToLower()) {
        "info" { $icon = [System.Windows.MessageBoxImage]::Information }
        "ask" { $icon = [System.Windows.MessageBoxImage]::Question }
        "warning" { $icon = [System.Windows.MessageBoxImage]::Warning }
        Default { $icon = [System.Windows.MessageBoxImage]::Question }
    }

    switch ($action.ToLower()) {
        "YesNo" 
        { 
            $action = [System.Windows.MessageBoxButton]::YesNo 
        }
        "OK" 
        {
            $action =  [System.Windows.MessageBoxButton]::OK 
        }
        Default { 
            $icon = [System.Windows.MessageBoxButton]::OK 
        }
    }
    
    if ([string]::IsNullOrWhiteSpace($key)) {
        # Show message with NoneKey if key is empty or null
        [System.Windows.MessageBox]::Show($NoneKey, "ITT", [System.Windows.MessageBoxButton]::$action, $icon)
    } else {
        # Retrieve localized message template and display message
        $localizedMessageTemplate = $itt.database.locales.Controls.$($itt.Language).$($key)
        $msg = "$localizedMessageTemplate"
        [System.Windows.MessageBox]::Show($msg, "ITT", [System.Windows.MessageBoxButton]::$action, $icon)
    }
}    