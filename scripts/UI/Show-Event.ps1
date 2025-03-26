function Show-Event {
    
    [xml]$event = $EventWindowXaml
    $itt.event = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $event))
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))

    $itt.event.FindName('closebtn').add_MouseLeftButtonDown({ $itt.event.Close() })
    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ DisablePopup; $itt.event.Close() })

    #{title}
    #{contorlshandler}
    
    $itt.event.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.event.Close() } })

    # Calculate timestamp
    $storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate
    if (($daysElapsed.Days -lt 1) -or (($itt.PopupWindow -eq "0") -and (-not $i))) {
        $itt.event.ShowDialog() | Out-Null
    }
}

function DisablePopup {
    Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
}