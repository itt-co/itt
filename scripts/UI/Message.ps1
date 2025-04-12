function Message {
    
    <#
        .SYNOPSIS
            Displays a localized message box to the user with a specified icon.
        .EXAMPLE
        Message -key "Welcome" -icon "Warning"
        .EXAMPLE 2
        Message -NoneKey "This normal text not based on locales" -icon "Warning"

    #>
    
    param([string]$key,[string]$NoneKey,[string]$title = "ITT",[string]$icon,[string]$action)

    $iconMap = @{ info = "Information"; ask = "Question"; warning = "Warning"; default = "Question" }
    $actionMap = @{ YesNo = "YesNo"; OK = "OK"; default = "OK" }
    $icon = if ($iconMap.ContainsKey($icon.ToLower())) { $iconMap[$icon.ToLower()] } else { $iconMap.default }
    $action = if ($actionMap.ContainsKey($action.ToLower())) { $actionMap[$action.ToLower()] } else { $actionMap.default }
    $msg = if ([string]::IsNullOrWhiteSpace($key)) { $NoneKey } else { $itt.database.locales.Controls.$($itt.Language).$key }
    [System.Windows.MessageBox]::Show($msg, $title, [System.Windows.MessageBoxButton]::$action, [System.Windows.MessageBoxImage]::$icon)
}