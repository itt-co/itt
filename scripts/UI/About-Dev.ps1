function About {
    # init child window
    [xml]$about = $AboutWindowXaml
    $childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
    $itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)
    # Get main style theme
    $itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.CurretTheme))
    # # Set Events on Click
    $itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
    $itt.about.FindName("telegram").Add_Click({Start-Process("https://t.me/emadadel4")})
    $itt.about.FindName("github").Add_Click({Start-Process("https://github.com/emadadel4/itt")})
    $itt.about.FindName("blog").Add_Click({Start-Process("https://emadadel4.github.io")})
    $itt.about.FindName("yt").Add_Click({Start-Process("https://www.youtube.com/@emadadel4")})
    $itt.about.FindName("coffee").Add_Click({Start-Process("https://buymeacoffee.com/emadadel")})
    # Set data context language
    $itt.about.DataContext = $itt.database.locales.Controls.$($itt.Language)
    # Show window
    $itt.about.ShowDialog() | Out-Null
}