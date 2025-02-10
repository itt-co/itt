function Finish {
    
    <#
        .SYNOPSIS
        Clears checkboxes in a specified ListView and displays a notification.
        .DESCRIPTION
        Clears all checkboxes in the ListView named "myListView" and displays a notification with the title "Process Completed", message "All items have been processed", and icon "Success".
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
            Add-Log -Message "Done." -Level "Apply"
            Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action]{ Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action]{
        # Uncheck all items
        foreach ($item in $itt.$ListView.Items) {
            if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                $item.Children[0].Children[0].IsChecked = $false
            }
        }
    

        Write-Host $global:CheckedItems

        # Clear the list view selection and reset the filter
        $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
        $collectionView.Filter = $null
        $collectionView.Refresh()
    })
}
function Show-Selected {
    param (
        [string]$ListView,
        [string]$mode
    )

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)

    switch ($mode) {
        "Filter" {
            $collectionView.Filter = {
                param ($item)

                # Ensure item structure is valid
                if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
                    return $false
                }

                # Check if item is selected
                return $item.Children[0].Children[0].IsChecked -eq $true
            }
        }
        Default {
            # Clear filter instead of removing all items
            $collectionView.Filter = $null

            # Reset selection to the first item (if available)
            $listView = $itt['window'].FindName($itt.CurrentList)
            if ($listView.Items.Count -gt 0) {
                $listView.SelectedIndex = 0
            }
        }
    }

    # Refresh the collection view
    $collectionView.Refresh()
}

function Clear-Item {
    param (
        $ListView
    )

    # Invoke the operation on the UI thread to ensure thread safety
    $itt.$ListView.Dispatcher.Invoke({
        
        # Loop through each item in the ListView
        foreach ($item in $itt.$ListView.Items) {

            # Ensure the item structure is valid before accessing properties
            if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                
                # Uncheck the checkbox in the first child element
                $item.Children[0].Children[0].IsChecked = $false
            }
        }

        # Clear all items from the ListView
        $itt.$ListView.Clear()
        $global:CheckedItems = @()

        # Reset the filter to show all items
        [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items).Filter = $null

        # Reset selection to the first item (if available)
        $itt['window'].FindName($itt.CurrentList).SelectedIndex = 0
    })
}