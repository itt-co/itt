function UpdateUI {

    <#
        .SYNOPSIS
        Updates  button's Content and width
    #>
    
    param([string]$Button, [string]$Content, [string]$Width = "140")
    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = $itt.database.locales.Controls.$($itt.Language).$Content -or $Content
    })
}
