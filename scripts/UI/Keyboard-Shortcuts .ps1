$KeyEvents = {

    <#
        .DESCRIPTION
            How to add a new shortcut

        .PARAMETER A
            replace A With you latter you want

        .PARAMETER Ctrl
            replace Ctrl With you latter you want

        .EXAMPLE
            if (($_.Key -eq "A" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {# your code here}      
    #>

    if ($itt.ProcessRunning -eq $true) {
        return
    }

    if (($_.Key -eq "Enter")) {

        switch ($itt.currentList) {
            "appslist" {
                Invoke-Install                
            }
            "tweakslist" {
                Invoke-Apply
            }
        }
    }

    # Installing & Applying
    if (($_.Key -eq "S" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {

        switch ($itt.currentList) {
            "appslist" {
                Invoke-Install                
            }
            "tweakslist" {
                Invoke-Apply
            }
        }
    }

    # Quit from applaction
     if (($_.Key -eq "G" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {
        $this.Close()
    }

    # Foucs on Search box
    if (($_.Key -eq "F" -and $_.KeyboardDevice.Modifiers -eq "Ctrl")) {
        $itt.SearchInput.Focus()
    }

    # Lost Foucs on Search box
    if ($_.Key -eq "Escape") {
        $itt.SearchInput.MoveFocus([System.Windows.Input.TraversalRequest]::New([System.Windows.Input.FocusNavigationDirection]::Next))
        $itt.SearchInput.Text = ""
    }

    # Easter Egg: Uncomment to enable the key press functionality
    
    # Next Music (Ctrl + N)
    # if ($_.Key -eq "N" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
    #     $itt.mediaPlayer.controls.next()
    # }

    # Previous Music (Ctrl + B)
    # if ($_.Key -eq "B" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
    #     $itt.mediaPlayer.controls.previous()
    # }

    # Swtich to Apps tap
    if ($_.Key -eq "Q" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "apps" }
    }

    # Swtich to tweaks tap
    if ($_.Key -eq "W" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "tweeksTab" }
    }

    # Swtich to settings tap
    if ($_.Key -eq "E" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "SettingsTab" }
    }

    # Swtich to settings tap
    if ($_.Key -eq "I" -and $_.KeyboardDevice.Modifiers -eq "Ctrl") {
        About
    }

    # SaveItemsToJson
    if ($_.Key -eq "S" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        SaveItemsToJson
    }

    # LoadJson
    if ($_.Key -eq "D" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        LoadJson
    }

    # Music off
    if ($_.Key -eq "M" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        MuteMusic -Value 0

    }

    # Music on 
    if ($_.Key -eq "F" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        UnmuteMusic -Value 100
    }
  
    # Restore point 
    if ($_.Key -eq "Q" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        RestorePoint
    }

    # Choco Shortcut Folder
    if ($_.Key -eq "C" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
    }

    # ITT Shortcut 
    if ($_.Key -eq "T" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        ITTShortcut
    }

     # ITT Shortcut 
     if ($_.Key -eq "I" -and $_.KeyboardDevice.Modifiers -eq "Shift") {
        ITTShortcut
    }
}