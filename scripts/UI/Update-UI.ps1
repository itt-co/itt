function UpdateUI {

    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.
    #>
    
    param([string]$Button, [string]$Content, [string]$Width = "140")
    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = $itt.database.locales.Controls.$($itt.Language).$Content -or $Content
    })
}
