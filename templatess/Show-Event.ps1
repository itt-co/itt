function Show-Event {


    [xml]$event = $EventWindowXaml
    $EventWindowReader = (New-Object System.Xml.XmlNodeReader $event)
    $itt.event = [Windows.Markup.XamlReader]::Load($EventWindowReader)
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))


    $itt.event.FindName('date').Text = $itt.date
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

    # Show dialog
    if($itt.PopupWindow -eq "off") {return}   
    $itt.event.ShowDialog() | Out-Null
}

function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value "off" -Force
}