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
                $element.Add_Click({ Invoke-Button $args[0].Name })
            }
            "MenuItem" {
                $element.Add_Click({
                        Invoke-Button $args[0].Name -Content $args[0].Header
                    })
            }
            "TextBox" {
                $element.Add_TextChanged({ Invoke-Button $args[0].Name })
                $element.Add_GotFocus({ Invoke-Button $args[0].Name })
            }
            "ComboBox" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Content })
            }
            "TabControl" {
                $element.add_SelectionChanged({ Invoke-Button $args[0].Name $args[0].SelectedItem.Name })
            }
            "CheckBox" {
                $element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
                $element.Add_Click({ Invoke-Toogle $args[0].Name })
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
        StopAllRunspace
    }
    else {
        $c.Cancel = $true
    }
}

$itt["window"].Add_ContentRendered({
        Startup
        Show-Event
})

$itt.SearchInput.Add_GotFocus({
        $itt.Search_placeholder.Visibility = "Hidden"
})

$itt.SearchInput.Add_LostFocus({
    if ([string]::IsNullOrEmpty($itt.SearchInput.Text)) {
        $itt.Search_placeholder.Visibility = "Visible"
    }
});

# Close Event handler
$itt["window"].add_Closing($onClosingEvent)
# Keyboard shortcut
$itt["window"].Add_PreViewKeyDown($KeyEvents)
# Show Window
$itt["window"].ShowDialog() | Out-Null
$script:powershell.Dispose()
$itt.runspace.Dispose()
$itt.runspace.Close()
[System.GC]::Collect()
$script:powershell.Stop()
$newProcess.exit
Stop-Transcript