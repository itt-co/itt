# Function to get all CheckBoxes from a StackPanel
function Get-CheckBoxesFromStackPanel {
    param (
        [System.Windows.Controls.StackPanel]$item
    )
    $checkBoxes = @()
    if ($item -is [System.Windows.Controls.StackPanel]) {
        foreach ($child in $item.Children) {
            if ($child -is [System.Windows.Controls.StackPanel]) {
                foreach ($innerChild in $child.Children) {
                    if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                        $checkBoxes += $innerChild
                    }
                }
            }
        }
    }
    return $checkBoxes
}
# Load JSON data and update the UI
function LoadJson {
    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Open file dialog to select JSON file
    $openFileDialog = New-Object Microsoft.Win32.OpenFileDialog -Property @{
        Filter = "JSON files (*.itt)|*.itt"
        Title  = "Open JSON File"
    }

    if ($openFileDialog.ShowDialog() -eq $true) {
        try {
            # Load and parse JSON data
            $jsonData = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json -ErrorAction Stop
            $filteredNames = $jsonData.Name

            # Get the apps list and collection view
            $appsList = $itt['window'].FindName('appslist')
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($appsList.Items)

            # Define the filter predicate
            $collectionView.Filter = {
                param($item)
                $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
                $checkBoxes.IsChecked = $filteredNames -contains $checkBoxes.Content
                return $checkBoxes.IsChecked
            }

            # Update UI
            $itt['window'].FindName('apps').IsSelected = $true
            $appsList.Clear()

            # Show success message
            Message -NoneKey "Restored successfully" -icon "info" -action "OK"
        } catch {
            Write-Warning "Failed to load or parse JSON file: $_"
            Message -NoneKey "Failed to load JSON file" -icon "error" -action "OK"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}
# Save selected items to a JSON file
function SaveItemsToJson {
    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "warning" -action "OK"
        return
    }

    # Clear any existing filters
    ClearFilter

    # Create a dictionary for faster lookups
    $appsDictionary = $itt.database.Applications | ForEach-Object { @{ $_.Name = $_ } }

    # Collect checked items
    $items = foreach ($item in $itt.AppsListView.Items) {
        $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
        if ($checkBoxes.IsChecked -and $appsDictionary.ContainsKey($checkBoxes.Content)) {
            [PSCustomObject]@{
                Name  = $checkBoxes.Content
                Check = "true"
            }
        }
    }

    # If no items are selected, show a message and return
    if ($items.Count -eq 0) {
        Message -key "Empty_save_msg" -icon "Information" -action "OK"
        return
    }

    # Open save file dialog
    $saveFileDialog = New-Object Microsoft.Win32.SaveFileDialog -Property @{
        Filter = "JSON files (*.itt)|*.itt"
        Title  = "Save JSON File"
    }

    if ($saveFileDialog.ShowDialog() -eq $true) {
        try {
            # Save items to JSON file
            $items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
            Write-Host "Saved: $($saveFileDialog.FileName)"
            Message -NoneKey "Saved successfully" -icon "info" -action "OK"

            # Uncheck all checkboxes
            foreach ($item in $itt.AppsListView.Items) {
                $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
                if ($checkBoxes.IsChecked) {
                    $checkBoxes.IsChecked = $false
                }
            }
        } catch {
            Write-Warning "Failed to save file: $_"
            Message -NoneKey "Failed to save file" -icon "error" -action "OK"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}
# Quick Install 
function Quick-Install {
    param (
        [string]$file
    )

        $QuickInstall = $true

        try {
            # Get file local or remote
            if ($file -match "^https?://") {

                $jsonData = Invoke-RestMethod -Uri $file -ErrorAction Stop

                if ($jsonData -isnot [array] -or $jsonData.Count -eq 0) {
                    Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
                    return
                }

            } else {

                $jsonData = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop

                if($file -notmatch "\.itt"){
                    Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
                    return
                }
            }

        } catch {
            Write-Warning "Failed to load or parse JSON file: $_"
            return
        }


    if($jsonData -eq $null){return}

    # Extract names from JSON data
    $filteredNames = $jsonData.Name

    # Get the apps list and collection view
    $appsList = $itt['window'].FindName('appslist')
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($appsList.Items)

    # Set the filter predicate
    $collectionView.Filter = {
        param($item)
        $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
        $checkBoxes.IsChecked = $filteredNames -contains $checkBoxes.Content
        return $checkBoxes.IsChecked
    }

    # Select the apps tab and clear the list
    $itt['window'].FindName('apps').IsSelected = $true
    $appsList.Clear()

    # Start the installation process
    try {
        Invoke-Install *> $null
    } catch {
        Write-Warning "Installation failed: $_"
    }
}