function UpdateUI {
    
    <#
        .SYNOPSIS
        Update button's content width, text.
    #>

    param([string]$Button,[string]$Content,[string]$Width = "140")

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = $itt.database.locales.Controls.$($itt.Language).$Content
    })
}