# Function to get all CheckBoxes from a StackPanel
function Get-CheckBoxes {
    $item.Children[0].Children[0]
    return $item
}

# Load JSON data and update the UI
function Load-SavedFile {
    # Check if a process is running
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }

    # Open file dialog to select JSON file
    $openFileDialog = New-Object Microsoft.Win32.OpenFileDialog -Property @{
        Filter = "itt files (*.itt)|*.itt"
        Title  = "itt File"
    }

    if ($openFileDialog.ShowDialog() -eq $true) {

        try {

       

            # Load and parse JSON data
            $FileContent = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json -ErrorAction Stop
            $filteredNames = $FileContent.Name

            if (-not $global:CheckedItems) {
                $global:CheckedItems = [System.Collections.ArrayList]::new()
            }
        
            foreach ($MyApp in $FileContent) {
                $global:CheckedItems.Add(@{ Content = $MyApp.Name; IsChecked = $true })
            }


            # Get the apps list and collection view
            $appsList = $itt['window'].FindName('appslist')
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($appsList.Items)

            # Define the filter predicate
            $collectionView.Filter = {
                param($item)

                if ($FileContent.Name -contains $item.Children[0].Children[0].Content) {
                    $item.Children[0].Children[0].IsChecked = $true
                    return $true
                }
                return $false
            }

            # Show success message
            Message -NoneKey "Restored successfully" -icon "info" -action "OK"


        } catch {
            Write-Warning "Failed to load or parse JSON file: $_"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Save selected items to a JSON file
function Save-File {
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
        
        $MyApp = Get-CheckBoxes
        
        if ($MyApp.IsChecked -and $appsDictionary.ContainsKey($MyApp.Content)) {
            [PSCustomObject]@{
                Name  = $MyApp.Content
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

                $item.Children[0].Children[0]

                if ($item.IsChecked) {
                    $item.IsChecked = $false
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

            $FileContent = Invoke-RestMethod -Uri $file -ErrorAction Stop

            if ($FileContent -isnot [array] -or $FileContent.Count -eq 0) {
                Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
                return
            }

        } else {

            $FileContent = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop

            if($file -notmatch "\.itt"){
                Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
                return
            }
        }

    } catch {
        Write-Warning "Failed to load or parse JSON file: $_"
        return
    }

    if($FileContent -eq $null){return}

    # Extract names from JSON data
    $filteredNames = $FileContent

    if (-not $global:CheckedItems) {
        $global:CheckedItems = [System.Collections.ArrayList]::new()
    }

    foreach ($MyApp in $FileContent) {
        $global:CheckedItems.Add(@{ Content = $MyApp.Name; IsChecked = $true })
    }

    # Get the apps list and collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['Window'].FindName('appslist').Items)

    # Set the filter predicate
    $collectionView.Filter = {
        param($item)

        if ($FileContent.Name -contains (Get-CheckBoxes).Content) {
            $item.Children[0].Children[0].IsChecked = $true
            return $true
        }
        return $false
    }

    # Start the installation process
    try {
        Invoke-Install *> $null
    } catch {
        Write-Warning "Installation failed: $_"
    }
}