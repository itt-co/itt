function Show-Event {
    if($itt.PopupWindow -eq "off") {return}   
    [xml]$event = $EventWindowXaml
    $EventWindowReader = (New-Object System.Xml.XmlNodeReader $event)
    $itt.event = [Windows.Markup.XamlReader]::Load($EventWindowReader)
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))
    $CloseBtn = $itt.event.FindName('closebtn')
    #{title}
    #{contorlshandler}
    $CloseBtn.add_MouseLeftButtonDown({
        $itt.event.Close()
    })
    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({
        DisablePopup
        $itt.event.Close()
    })
    # Escape to Close window
    $KeyEvents = {
        if ($_.Key -eq "Escape") {
            $itt.event.Close()
        }
    }
    $itt.event.Add_PreViewKeyDown($KeyEvents)
    # Show dialog
    $itt.event.ShowDialog() | Out-Null
}
function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value "off" -Force
}