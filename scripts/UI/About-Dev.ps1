function About {
    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)
    $itt.about.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.about.Close() } })
    # Get main style theme
    $itt['about'].Resources.MergedDictionaries.Clear()
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))
    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_MouseLeftButtonDown({ Start-Process("https://t.me/emadadel4") })
    $itt.about.FindName("github").Add_MouseLeftButtonDown({ Start-Process("https://github.com/emadadel4/itt") })
    $itt.about.FindName("blog").Add_MouseLeftButtonDown({ Start-Process("https://emadadel4.github.io") })
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.$($itt.Language)
    # Show window
    $itt.about.ShowDialog() | Out-Null
}