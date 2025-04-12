function Statusbar {

    param(
       $Mode,
       [string]$Text,
       [string]$Icon
    )
    
    function UpdateText {
        
        $itt.Statusbar.Dispatcher.Invoke([Action] { 
            $itt.Statusbar.Text = "$Icon $Text"
        })
    }

    switch ($Mode) {

        Default {UpdateText -Text $text -Icon $icon}

        "Quote" { 
            
            $q = (Invoke-RestMethod "C:\Users\Unknown\Documents\GitHub\itt\static\Database\Quotes.json").Quotes | Sort-Object { Get-Random }
            $iconMap = @{quote = "💬"; info = "📢"; music = "🎵"; Cautton = "⚠"; default = "☕" }
            $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })

            do {
                foreach ($q in $q) {
                    $icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
                    $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
                    UpdateText -Text $text -Icon $icon
                }
            } while ($true)

        }
    }
}