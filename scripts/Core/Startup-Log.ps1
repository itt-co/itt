function Startup {

    $UsersCount = "https://ittools-7d9fe-default-rtdb.firebaseio.com/message/message.json"
 
    ITT-ScriptBlock -ArgumentList $Debug $UsersCount -ScriptBlock {
 
        param($Debug, $UsersCount)
        function Telegram {
            param (
                [string]$Message
            )
            try {
                # This only do Devices count
                $BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI"
                $ChatID = "1299033071"
                # This only do Devices count
                $SendMessageUrl = "https://api.telegram.org/bot$BotToken"
                $PostBody = @{
                    chat_id = $ChatID
                    text    = $Message
                }
                $Response = Invoke-RestMethod -Uri "$SendMessageUrl/sendMessage" -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
            }
            catch {
                Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
            }
        }
 
        function GetCount {
            # Fetch data using GET request
            $response = Invoke-RestMethod -Uri $UsersCount -Method Get
         
            # Output the Users count
            return $response
        }
         
        function PlayMusic {

            $ST = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/OST.json" -Method Get

            # Function to play an audio track
            function PlayAudio($track) {
                $mediaItem = $itt.mediaPlayer.newMedia($track)
                $itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
                $itt.mediaPlayer.controls.play()

                # debug start
                    # $currentFileName = $itt.mediaPlayer.currentMedia.name
                    # Write-Host "Currently playing: $currentFileName"
                # debug end
            }
            # Shuffle the playlist and create a new playlist
            function GetShuffledTracks {
                switch ($itt.Date.Month, $itt.Date.Day) {
                    { $_ -eq 9, 1 } { return $ST.Favorite | Get-Random -Count $ST.Favorite.Count }
                    { $_ -eq 10, 6 -or $_ -eq 10, 7 } { return $ST.Otobers | Get-Random -Count $ST.Otobers.Count }
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
 
        function UsageCount {

            # Fetch current count from Firebase as a string
            $currentCount = Invoke-RestMethod -Uri $UsersCount -Method Get
        
            # Convert to integer, increment, and convert back to string
            $Runs = ([int]$currentCount + 1).ToString()
        
            # Update the count in Firebase as a string
            Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($Runs | ConvertTo-Json -Compress) -Headers @{ "Content-Type" = "application/json" }
        
            # Output success
            Telegram -Message "Launch from`n$($itt.command)`nUsage`n$($Runs)"
        }
 
        function LOG {
            Write-Host "  `n` "
            Write-Host "  ███████████████████╗ Be the first to uncover the secret! Dive into"
            Write-Host "  ██╚══██╔══╚═══██╔══╝ the source code, find the feature and integrate it"
            Write-Host "  ██║  ██║ Emad ██║    https://github.com/emadadel4/itt"
            Write-Host "  ██║  ██║ Adel ██║    "
            Write-Host "  ██║  ██║      ██║    "
            Write-Host "  ╚═╝  ╚═╝      ╚═╝    "
            UsageCount
            Write-Host "`n  ITT has been used $(GetCount) times worldwide.`n" -ForegroundColor White
        }
        # debug start
        if ($Debug) { return }
        # debug end
        LOG
        PlayMusic
        Statusbar -Text $itt.database.locales.Controls.$($itt.Language).welcome  -icon "☕"
        Start-Sleep 18
        Statusbar -Text $itt.database.locales.Controls.$($itt.Language).easter_egg -icon "👁‍🗨"
        Start-Sleep 18
        Statusbar -Mode "Quote"
    }
}
