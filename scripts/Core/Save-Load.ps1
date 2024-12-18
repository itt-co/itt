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
# Function to load JSON data and update the UI
function LoadJson {
    if ($itt.ProcessRunning) {
        Message -key "Please_wait" -icon "Warning" -action "OK"
        return
    }
    # Open file dialog to select JSON file
    $openFileDialog = New-Object "Microsoft.Win32.OpenFileDialog"
    $openFileDialog.Filter = "JSON files (*.itt)|*.itt"
    $openFileDialog.Title = "Open JSON File"
    $dialogResult = $openFileDialog.ShowDialog()
    if ($dialogResult -eq "OK") {
        $jsonData = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json
        $filteredNames = $jsonData.Name
        # Filter predicate to match CheckBoxes with JSON data
        $filterPredicate = {
            param($item)
            $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
            foreach ($currentItemName in $filteredNames) {
                if ($currentItemName -eq $checkBoxes.Content) {
                    $checkBoxes.IsChecked = $true
                    break
                }
            }
            return $filteredNames -contains $checkBoxes.Content
        }
        # Update UI based on the loaded JSON data
        $itt['window'].FindName('apps').IsSelected = $true
        $itt['window'].FindName('appslist').Clear()
        $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName('appslist').Items)
        $collectionView.Filter = $filterPredicate
        Message -NoneKey "Restored successfully" -icon "info" -action "OK"
    }
}
# Function to save selected items to a JSON file
function SaveItemsToJson {
    if ($itt.ProcessRunning) {
        $msg = $itt.database.locales.Controls.$($itt.Language).Pleasewait
        Message -key "Please_wait" -icon "warning" -action "OK"
        return
    }
    ClearFilter
    # Convert the applications list to a dictionary for faster lookups
    $appsDictionary = @{}
    foreach ($app in $itt.database.Applications) {
        $appsDictionary[$app.Name] = $app
    }
    # Initialize the items list as a specific type
    $items = @()
    foreach ($item in $itt.AppsListView.Items) {
        $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
        if ($checkBoxes.IsChecked) {
            $app = $appsDictionary[$checkBoxes.Content]
            if ($app) {
                $itemObject = [PSCustomObject]@{
                    Name   = $checkBoxes.Content
                    check  = "true"
                    choco  = $app.choco
                    winget = $app.winget
                }
                $items += $itemObject
            }
        }
    }
    if ($items.Count -gt 0) {
        # Open save file dialog
        $saveFileDialog = New-Object "Microsoft.Win32.SaveFileDialog"
        $saveFileDialog.Filter = "JSON files (*.itt)|*.itt"
        $saveFileDialog.Title = "Save JSON File"
        $dialogResult = $saveFileDialog.ShowDialog()
        if ($dialogResult -eq "OK") {
            $items | ConvertTo-Json | Out-File -FilePath $saveFileDialog.FileName -Force
            Write-Host "Saved: $($saveFileDialog.FileName)"
            Message -NoneKey "Saved successfully" -icon "info" -action "OK"
            foreach ($item in $itt.AppsListView.Items) {
                $checkBoxes = Get-CheckBoxesFromStackPanel -item $item
                if ($checkBoxes.IsChecked) {
                    $checkBoxes.IsChecked = $false
                }
            }
        }
    } else {
        Message -key "Empty_save_msg" -icon "Information" -action "OK"
    }
    # Clear Search input
    $itt.SearchInput.Text = ""
}
