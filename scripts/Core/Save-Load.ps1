# load file.itt
function Get-file {

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

            # Get the apps list and collection view
            $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)

            # Define the filter predicate
            $collectionView.Filter = {
                param($item)

                if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
            }
        }
        catch {
            Write-Warning "Failed to load or parse JSON file: $_"
        }
    }

    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Save selected items to a JSON file
function Save-File {
    
    $itt['window'].FindName("AppsCategory").SelectedIndex = 0
    Show-Selected -ListView "AppsListView" -Mode "Filter"

    # Collect checked items
    $items = foreach ($item in $itt.AppsListView.Items) {
        
        if ($item.Children[0].Children[0].IsChecked) {
            [PSCustomObject]@{
                Name  = $item.Children[0].Children[0].Content
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
        # Save items to JSON file
        $items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
        Write-Host "Saved: $($saveFileDialog.FileName)"
    }

    # Uncheck checkboxex if user Cancel 
    Show-Selected -ListView "AppsListView" -Mode "Default"
    
    # Clear search input
    $itt.Search_placeholder.Visibility = "Visible"
    $itt.SearchInput.Text = $null
}

# Quick Install 
function Quick-Install {
    
    param (
        [string]$file
    )

    try {
        # Get file local or remote
        if ($file -match "^https?://") {

            $FileContent = Invoke-RestMethod -Uri $file -ErrorAction Stop

            if ($FileContent -isnot [array] -or $FileContent.Count -eq 0) {
                Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
                return
            }

        }
        else {

            $FileContent = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop

            if ($file -notmatch "\.itt") {
                Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
                return
            }
        }

    }
    catch {
        Write-Warning "Failed to load or parse JSON file: $_"
        return
    }

    if ($null -eq $FileContent) { return }

    # Get the apps list and collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['Window'].FindName('appslist').Items)

    # Set the filter predicate
    $collectionView.Filter = {
        param($item)

        if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
    }

    # Start the installation process
    try {
        Invoke-Install *> $null
    }
    catch {
        Write-Warning "Installation failed: $_"
    }
}