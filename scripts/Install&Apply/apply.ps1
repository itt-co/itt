function Invoke-Apply {

    <#
        .SYNOPSIS
        Handles the application of selected tweaks by executing the relevant commands, registry modifications, and other operations.
    #>

    # Clear Search QUery
    $itt.searchInput.text = $null
    $itt.Search_placeholder.Visibility = "Visible"

    $itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
    $selectedTweaks = Get-SelectedItems -Mode "Tweaks"

    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Return if there is no selection
    if ($selectedTweaks.Count -le 0) {return}

    Show-Selected -ListView "TweaksListView" -Mode "Filter"

    $result = Message -key "Apply_msg" -icon "ask" -action "YesNo"

    if ($result -eq "no") {
        Show-Selected -ListView "TweaksListView" -Mode "Default"
        return
    }

    ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {

        param($selectedTweaks, $debug)

        if((Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup -eq 0){
            UpdateUI -Button "ApplyBtn" -NonKey "Please Wait..." -Width "auto"
            Set-Statusbar -Text "ℹ Current task: Creating Restore Point..."
            CreateRestorePoint
        } 
        
        $itt.ProcessRunning = $true

        UpdateUI -Button "ApplyBtn" -Content "Applying" -Width "auto"

        $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })

        foreach ($tweak in $selectedTweaks) {
            Add-Log -Message "::::$($tweak.Name)::::" -Level "default"
            $tweak | ForEach-Object {
                if ($_.Script -and $_.Script.Count -gt 0) {
                    ExecuteCommand -tweak $tweak.Script
                    if ($_.Refresh -eq $true) {
                        Refresh-Explorer
                    }
                } 
                if ($_.Registry -and $_.Registry.Count -gt 0) {
                    Set-Registry -tweak $tweak.Registry
                    if ($_.Refresh -eq $true) {
                        Refresh-Explorer
                    }
                } 
                if ($_.AppxPackage -and $_.AppxPackage.Count -gt 0) {
                    Uninstall-AppxPackage -tweak $tweak.AppxPackage
                    if ($_.Refresh -eq $true) {
                        Refresh-Explorer
                    }
                } 
                if ($_.ScheduledTask -and $_.ScheduledTask.Count -gt 0) {
                    Remove-ScheduledTasks -tweak $tweak.ScheduledTask
                    if ($_.Refresh -eq $true) {
                        Refresh-Explorer
                    }
                } 
                if ($_.Services -and $_.Services.Count -gt 0) {
                    Disable-Service -tweak $tweak.Services
                    if ($_.Refresh -eq $true) {
                        Refresh-Explorer
                    }
                } 
            }
        }

        $itt.ProcessRunning = $false
        Finish -ListView "TweaksListView"
    }
}