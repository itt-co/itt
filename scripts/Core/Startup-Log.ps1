function Startup  {

    ITT-ScriptBlock -ArgumentList $Debug -ScriptBlock {

        param($Debug)
        function Telegram {
                param (
                [string]$Message
            )
            try {
                #===========================================================================
                #region Plz don't use this for bad things
                #===========================================================================
                $BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI"
                $ChatID = "1299033071"
                #===========================================================================
                #endregion Plz don't use this for bad things
                #===========================================================================
                $SendMessageUrl = "https://api.telegram.org/bot$BotToken"
                $PostBody = @{
                    chat_id    = $ChatID
                    text       = $Message
                }
                $Response = Invoke-RestMethod -Uri "$SendMessageUrl/sendMessage" -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
        
        function PlayMusic {

            $ST = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/OST.json" -Method Get

            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()
                # debug start
                    #$currentFileName = $itt.mediaPlayer.currentMedia.name
                    #Write-Host "Currently playing: $currentFileName"
                # debug end
            }
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
                switch ($itt.Date.Month, $itt.Date.Day) {
                    { $_ -eq 9, 1 } { return $ST.Favorite | Get-Random -Count $ST.Favorite.Count }
                    { $_ -eq 10, 6 -or $_ -eq 10, 7 } { return $itt.database.OST.Otobers | Get-Random -Count $ST.Otobers.Count }
                    default { return $ST.Tracks | Get-Random -Count $ST.Tracks.Count }
                }
            }
            # Preload and play the shuffled playlist
            function PlayPreloadedPlaylist {
                # Preload the shuffled playlist
                $shuffledTracks = GetShuffledTracks
                foreach ($track in $shuffledTracks) {
                    PlayAudio -track $track.url
                    # Wait for the track to finish playing
                    while ($itt.mediaPlayer.playState -in @(3, 6)) {
                        Start-Sleep -Milliseconds 100
                    }
                }
            }
            # Play the preloaded playlist
            PlayPreloadedPlaylist
        }

        function Quotes {
            function Get-Quotes {
                (Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }
            }
            
            function Show-Quote($text, $icon) {
                $itt.Quotes.Dispatcher.Invoke([Action]{ 
                    $itt.QuoteIcon.Text = $icon
                    $itt.Quotes.Text = $text
                })
            }
        
            Show-Quote $itt.database.locales.Controls.$($itt.Language).welcome ""
            Start-Sleep 20
            Show-Quote "Can you uncover the hidden secret? Dive into the source code, be the first to discover the feature, and integrate it into the tool" ""
            Start-Sleep 18
            $iconMap = @{quote=""; info=""; music=""; Cautton=""; default=""}
            do {
                foreach ($q in Get-Quotes) {
                    $icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
                    $text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
                    Show-Quote $text $icon
                    Start-Sleep 20
                }
            } while ($true)
        }

        function UpdateUserCount {
            $newCount = (Invoke-RestMethod -Uri "https://ittools-7d9fe-default-rtdb.firebaseio.com/Count.json" -Method Get) + 1
            Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($newCount | ConvertTo-Json) -Headers @{ "Content-Type" = "application/json" }
            return $newCount
        }
        
        function Welcome {
            $runs = (Get-ItemProperty -Path $itt.registryPath -Name "Runs" -ErrorAction SilentlyContinue).Runs + 1
            Set-ItemProperty -Path $itt.registryPath -Name "Runs" -Value $runs
        
            if ($runs -eq 1) {
                $totalDevices = UpdateUserCount
                Telegram -Message "🎉New User`n`👤 $env:USERNAME `n`🌐 Language: $($itt.Language)`n`🖥 Total devices:$(UpdateUserCount)" 
            }
        
            Write-Host "`n ITT has been used on $(Invoke-RestMethod -Uri "https://ittools-7d9fe-default-rtdb.firebaseio.com/Count.json" -Method Get) devices worldwide.`n" -ForegroundColor White
        }

        function LOG {
            param (
                $message,
                $color
            )
            Write-Host "`n` #StandWithPalestine"
            Write-Host "  ___ _____ _____   _____ __  __    _    ____       _    ____  _____ _"
            Write-Host " |_ _|_   _|_   _| | ____|  \/  |  / \  |  _ \     / \  |  _ \| ____| |"
            Write-Host "  | |  | |   | |   |  _| | |\/| | / _ \ | | | |   / _ \ | | | |  _| | |"
            Write-Host "  | |  | |   | |   | |___| |  | |/ ___ \| |_| |  / ___ \| |_| | |___| |___"
            Write-Host " |___| |_|   |_|   |_____|_|  |_/_/   \_\____/  /_/   \_\____/|_____|_____|"
            Write-Host " Launch Anytime, Anywhere! `n` " 
            Write-Host " Telegram: https://t.me/emadadel4"
            Write-Host " Source Code: https://github.com/emadadel4/itt"
            Welcome
        }
        # debug start
            if($Debug){return}
        # debug end
        LOG
        PlayMusic
        Quotes
    }
}