function UpdateUI {

    <#
        .SYNOPSIS
        Updates the user interface elements, including a button's width, text, and associated icons.

        .DESCRIPTION
        The `UpdateUI` function is designed to modify various UI components within the application. 
        It updates the width and text of a specified button, changes the text of a related text block, and sets the icon for another text block. 
        This function is typically used to reflect different states of the application, such as during installations or other processes.

        .PARAMETER Button
        Specifies the name of the button element to be updated.

        .PARAMETER ButtonText
        Specifies the name of the text block associated with the button whose text will be updated.

        .PARAMETER Icon
        Specifies the icon to be set in the text block.

        .PARAMETER Content
        Specifies the content to be displayed as button text. This content is localized based on the application's current language setting.

        .PARAMETER TextIcon
        Specifies the name of the text block where the icon will be displayed.

        .PARAMETER Width
        Specifies the width to set for the button. The default value is "100".

        .EXAMPLE
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "downloading" -TextIcon "installIcon" -Icon "  " -Width "150"
        This example updates the UI by setting the width of the "InstallBtn" button to 150, changing the text of the "installText" text block to "downloading", 
        and setting the icon for the "installIcon" text block to "  ".
    #>


    param(
        [string]$Button,
        [string]$ButtonText,
        [string]$Icon,
        [string]$Content,
        [string]$TextIcon,
        [string]$Width = "100"
    )

    $applyBtn = $itt.database.locales.Controls.$($itt.Language).$Content

    $itt['window'].Dispatcher.Invoke([Action]{

        # Button and Button Text
        $itt.$Button.Width = $Width
        $itt.$ButtonText.Text = "$applyBtn"

        # Textblock as Icon
        $itt.$TextIcon.Text = "$icon"
    })
}