function Show-Event {
    
    [xml]$event = $EventWindowXaml
    $itt.event = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $event))
    $itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))

    $itt.event.FindName('closebtn').add_MouseLeftButtonDown({ $itt.event.Close() })
    $itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force; $itt.event.Close() })

    #{title}
    #{contorlshandler}

    # Calculate timestamp
    $storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
    $daysElapsed = (Get-Date) - $storedDate
    if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) {return}
    $itt.event.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.event.Close() } })
    if ($daysElapsed.Days -lt 1){$itt.event.FindName('DisablePopup').Visibility = 'Hidden'}
    $itt.event.ShowDialog() | Out-Null

}