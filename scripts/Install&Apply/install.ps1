function Invoke-Install {
    <#
        .SYNOPSIS
        Handles the installation of selected applications by invoking the appropriate installation methods.
    #>

        
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }
    
    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"

    # Get Selected apps
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    $selectedApps = Get-SelectedItems -Mode "Apps"

    # Return if there is no selection
    if ($selectedApps.Count -le 0) {return}

    Show-Selected -ListView "AppsListView" -Mode "Filter"

    if (-not $i) {
        $result = Message -key "Install_msg" -icon "ask" -action "YesNo"
    }
    
    if ($result -eq "no") {
        Show-Selected -ListView "AppsListView" -Mode "Default"
        return
    }

    $itt.PackgeManager = (Get-ItemProperty -Path $itt.registryPath -Name "source" -ErrorAction Stop).source

    ITT-ScriptBlock -ArgumentList $selectedApps $i $source -Debug $debug -ScriptBlock {

        param($selectedApps , $i, $source)

        UpdateUI -Button "installBtn" -Content "Downloading" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        $itt.ProcessRunning = $true

        foreach ($App in $selectedApps) {

            Write-Host $source

            Set-Statusbar -Text "ℹ Current task: Downloading $($App.Name)"

            # Some packages won't install until the package folder is removed.
            $chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($App.Choco)"
            $ITTFolder = Join-Path $env:ProgramData "itt\downloads\$($App.ITT)"

            Remove-Item -Path "$chocoFolder" -Recurse -Force
            Remove-Item -Path "$chocoFolder.install" -Recurse -Force
            Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
            Remove-Item -Path "$ITTFolder" -Recurse -Force

            
            $Install_result = Install-App -Source $itt.PackgeManager -Name $App.Name -Choco $App.Choco -Scoop $App.Scoop -Winget $App.Winget -itt $App.ITT

            if ($Install_result.Success) {
                Set-Statusbar -Text "✔ $($Install_result.Message)"
                Add-Log -Message "$($Install_result.Message)" -Level "info"
            } else {
                Set-Statusbar -Text "✖ $($Install_result.Message)"
                Add-Log -Message "$($Install_result.Message)" -Level "ERROR"
            }
            
            # debug start
            if ($Debug) { Add-Log -Message "$($App.Choco) | $($App.Scoop) | $($App.Winget) | $($App.ITT)"  -Level "debug" }
            # debug end
        }

        Finish -ListView "AppsListView"
        $itt.ProcessRunning = $false
    }
}