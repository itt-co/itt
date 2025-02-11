#=========================================================================== 
#region Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 
$MainXaml.SelectNodes("//*[@Name]") | ForEach-Object {
    $name = $_.Name
    $element = $itt["window"].FindName($name)
    if ($element) {
        $itt[$name] = $element
        # Add event handlers based on element type
        switch ($element.GetType().Name) {
            "Button" {
                $element.Add_Click({ Invoke-Button $args[0].Name $args[0].Content })
            }
            "MenuItem" {
                $element.Add_Click({
                    Invoke-Button $args[0].Name -Content $args[0].Header
                })
            }
            "TextBox" {
                $element.Add_TextChanged({ Invoke-Button $args[0].Name $args[0].Text})
                $element.Add_GotFocus({ Invoke-Button $args[0].Name $args[0].Text})
            }
            "ComboBox" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Content})
            }
            "TabControl" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Name})
            }
            "CheckBox" {
                $element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
                $element.Add_Click({ Invoke-Toggle $args[0].Name})
            }
        }
    }
}
#=========================================================================== 
#endregion Select elements with a Name attribute using XPath and iterate over them
#=========================================================================== 

# Define OnClosing event handler
$onClosingEvent = {
    param($s, $c)
    # Show confirmation message box
    $result = Message -title "Are you sure" -key "Exit_msg" -icon "ask" -action "YesNo"
    if ($result -eq "Yes") {
        Manage-Music -action "StopAll" 
    }
    else {
        $c.Cancel = $true
    }
}

# Attach event handlers and other operations
$itt["window"].Add_ContentRendered({
    Startup
    Show-Event
})

# Search input events
$itt.SearchInput.Add_GotFocus({
    $itt.Search_placeholder.Visibility = "Hidden"
})

$itt.SearchInput.Add_LostFocus({
    if ([string]::IsNullOrEmpty($itt.SearchInput.Text)) {
        $itt.Search_placeholder.Visibility = "Visible"
    }
})

# Quick install
if ($i) {
    Quick-Install -file $i *> $null
}

# Close event handler
$itt["window"].add_Closing($onClosingEvent)

# Keyboard shortcut
$itt["window"].Add_PreViewKeyDown($KeyEvents)

# Show Window
$itt["window"].ShowDialog()

# Dispose of runspaces and other objects
$itt.runspace.Dispose()
$itt.runspace.Close()

# Collect garbage
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Stop PowerShell session and release resources
$script:powershell.Dispose()
$script:powershell.Stop()

# Wait for new process to exit
$newProcess.Exit

# Stop transcript logging
Stop-Transcript *> $null