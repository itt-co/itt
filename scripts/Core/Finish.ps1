function Finish {
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        This function iterates through the items in a specified ListView, unchecks any CheckBox controls within it, and clears the ListView. After clearing the ListView, it uses the `Notify` function to display a notification with a given title, message, and icon.
        .PARAMETER ListView
        The name of the ListView control within the `$itt` object that needs to be processed. This parameter is required.
        .PARAMETER title
        The title for the notification message. Defaults to "ITT Emad Adel" if not specified.
        .PARAMETER msg
        The message content for the notification. Defaults to "Installed successfully" if not specified.
        .PARAMETER icon
        The icon to be used in the notification. Defaults to "Info" if not specified.
        .EXAMPLE
        Finish -ListView "myListView" -title "Process Completed" -msg "All items have been processed" -icon "Success"
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
        .NOTES
        - Ensure that the `Notify` function is implemented and available in your script to handle notification display.
        - The function assumes the `$itt` object and its `ListView` are properly initialized and accessible.
        - The notification duration is set to 30 seconds (`30000` milliseconds).
    #>
    param (
       [string]$ListView,
       [string]$title = "ITT Emad Adel",
       [string]$icon = "Info"
    )
    switch($ListView)
    {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -ButtonText "installText" -Content "Install" -TextIcon "installIcon" -Icon "  " -Width "140"
            Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -ButtonText "applyText" -Content "Apply" -TextIcon "applyIcon" -Icon "  " -Width "140"
            Add-Log -Message "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -Level "INFO"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }
    $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "None" -value 0.01 -icon "done" })
    # Clear 
    $itt.$ListView.Dispatcher.Invoke([Action]{
        foreach ($item in $itt.$ListView.Items)
        {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            $innerChild.IsChecked = $false
                            $itt.$ListView.Clear()
                            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
                            $collectionView.Filter = $null
                        }
                    }
                }
            }
        }
    })
}
function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )
    switch ($mode) {
        "Filter" {
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
            $filterPredicate = {
                param($item)
                if ($item -is [System.Windows.Controls.StackPanel]) {
                    foreach ($child in $item.Children) {
                        if ($child -is [System.Windows.Controls.StackPanel]) {
                            foreach ($innerChild in $child.Children) {
                                if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                                    return $innerChild.IsChecked -eq $true
                                }
                            }
                        }
                    }
                }
                return $true
            }
            $collectionView.Filter = $filterPredicate
        }
        Default {
            $itt.$ListView.Clear()
            [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null
            $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
        }
    }
}
function Clear-Item {
    <#
        .SYNOPSIS
        Unchecks all checkboxes in a specified ListView and clears the ListView.
        .DESCRIPTION
        This function iterates through all items in a specified ListView, unchecking any CheckBox controls within those items. After unchecking the checkboxes, it clears the ListView and removes any applied filters. It also resets the category selection to the first item.
        .PARAMETER ListView
        The name of the ListView control within the `$itt` object that needs to be processed. This parameter is required.
        .EXAMPLE
        Clear-Item -ListView "AppsListView"
        Unchecks all checkboxes in the "AppsListView", clears the ListView, and resets the category selection.
        .NOTES
        - The function assumes that the `$itt` object and its `ListView` are properly initialized and accessible.
        - The `Dispatcher.Invoke` method is used to ensure that UI changes are made on the UI thread, which is necessary for interacting with WPF controls.
        - The `category.SelectedIndex` is set to 0, which resets the category dropdown or selection to its initial state.
    #>
    param (
        $ListView
    )
     # Uncheck all checkboxes in $list if user chose [NO]
     $itt.$ListView.Dispatcher.Invoke({
        foreach ($item in $itt.$ListView.Items) {
            $item.Children | ForEach-Object {
                if ($_ -is [System.Windows.Controls.StackPanel]) {
                    $_.Children | ForEach-Object {
                        if ($_ -is [System.Windows.Controls.CheckBox]) {
                            $_.IsChecked = $false
                        }
                    }
                }
            }
        }
        $itt.$ListView.Clear()
        [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null
    })
    $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
}