function UpdateUI {
    
    <#
        .SYNOPSIS
        Update button's content width, text.
    #>

    param([string]$Button,[string]$Content,[string]$Width = "140")
    
    $key = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = "$key"
    })
}