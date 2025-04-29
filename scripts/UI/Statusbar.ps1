function Set-Statusbar {
    
    <#
        .SYNOPSIS
        Set Statusbar text
    #>

    param ([string]$Text)
    $itt.Statusbar.Dispatcher.Invoke([Action]{$itt.Statusbar.Text = $Text })
}