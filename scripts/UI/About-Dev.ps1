function About {

    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)

    # Get main style theme
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))

    # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").add_MouseLeftButtonDown({Start-Process($itt.telegram)})
    $itt.about.FindName("github").add_MouseLeftButtonDown({Start-Process($itt.github)})
    $itt.about.FindName("blog").add_MouseLeftButtonDown({Start-Process($itt.blog)})
    $itt.about.FindName("yt").add_MouseLeftButtonDown({Start-Process($itt.youtube)})
    $itt.about.FindName("coffee").add_MouseLeftButtonDown({Start-Process($itt.buymeacoffee)})
    
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.en

    # Show window
    $itt.about.ShowDialog() | Out-Null
}