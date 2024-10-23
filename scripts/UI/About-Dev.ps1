function About {

    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)

    # Get main style theme
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))

    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_Click({Start-Process($itt.telegram)})
    $itt.about.FindName("github").Add_Click({Start-Process($itt.github)})
    $itt.about.FindName("blog").Add_Click({Start-Process($itt.blog)})
    $itt.about.FindName("yt").Add_Click({Start-Process($itt.youtube)})
    $itt.about.FindName("coffee").Add_Click({Start-Process($itt.buymeacoffee)})
    
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.en

    # Show window
    $itt.about.ShowDialog() | Out-Null
}