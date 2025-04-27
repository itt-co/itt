function UpdateUI {
    
    <#
        .SYNOPSIS
        Update interface elements, including a button's width, text, and associated icons.
    #>

    param([string]$Button,[string]$Content,[string]$Width = "140")
    
    $key = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = "$key"
    })
}