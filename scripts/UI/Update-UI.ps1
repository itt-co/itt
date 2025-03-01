function UpdateUI {
    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.
        .DESCRIPTION
        The `UpdateUI` function is designed to modify various UI components within the application. 
        It updates the width and text of a specified button, changes the text of a related text block, and sets the icon for another text block. 
        This function is typically used to reflect different states of the application, such as during installations or other processes.
    #>
    param(
        [string]$Button,
        [string]$Content,
        [string]$Width = "140"
    )
    
    $key = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{
        $itt.$Button.Width = $Width
        $itt.$Button.Content = "$key"
    })
}