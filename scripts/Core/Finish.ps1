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
    switch ($ListView) {
        "AppsListView" {
            UpdateUI -Button "InstallBtn" -Content "Install" -Width "140"
            Notify -title "$title" -msg "All installations have finished" -icon "Info" -time 30000
            Add-Log -Message "::::All installations have finished::::"
            Set-Statusbar -Text "[i] All installations have finished"
        }
        "TweaksListView" {
            UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
            Add-Log -Message "::::All tweaks have finished::::"
            Set-Statusbar -Text "[i] All tweaks have finished"
            Notify -title "$title" -msg "All tweaks have finished" -icon "Info" -time 30000
        }
    }

    # Reset Taskbar Progress
    $itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })

    # Uncheck all items in ListView
    $itt.$ListView.Dispatcher.Invoke([Action] {
            # Uncheck all items
            foreach ($item in $itt.$ListView.Items) {
                if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
                    $item.Children[0].Children[0].IsChecked = $false
                }
            }
            
            # Clear the list view selection and reset the filter
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
            $collectionView.Filter = $null
            $collectionView.Refresh()

            # Close window after install apps
            # if ($i -ne "") {
            #     Manage-Music -action "StopAll" 
            #     $itt["window"].Close()
            # }
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

                # Check if item is selected
                return $item.Children[0].Children[0].IsChecked -eq $true
            }
        }
        Default {

            $collectionView.Filter = {
                param ($item)

                # Uncheck all checkboxes
                $item.Children[0].Children[0].IsChecked = $false
            }

            # Reset collection view
            $collectionView.Filter = $null
        }
    }
}