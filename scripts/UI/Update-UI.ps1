function UpdateUI {
    
    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.
    #>

    param([string]$Button,[string]$Content,[string]$Width = "140")
    
    $key = $itt.database.locales.Controls.$($itt.Language).$Content

    $text = if (-not $key) { $Content } else { $key }

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = "$text"
    })
}
