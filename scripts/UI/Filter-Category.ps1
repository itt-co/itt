function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.
    #>

    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)

    $collectionView.Filter = {
        param ($item)

        # Ensure item structure is valid
        if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
            return $false
        }

        # Search within first-level child content
        return $item.Children[0].Children[0].Content -match $filter -or $item.Children[0].Children[0].Tag -match $filter
    }
}

function FilterByCat {

    <#
        .SYNOPSIS
        Filters the items in the Apps list view based on the selected category.
        .DESCRIPTION
        The `FilterByCat` function filters the items displayed in the Apps list view based on a specified category. It updates the view to show only those items that match the selected category. If the selected category is not valid, it clears the filter and displays all items. The function also ensures that the Apps tab is selected and scrolls to the top of the list view after applying the filter.
        .EXAMPLE
        FilterByCat -Cat "Media"
    #>

    param ($Cat)

    # List of valid categories
    $validCategories = @(
        "Web Browsers", "Media", "Media Tools", "Documents", "Compression",
        "Communication", "File Sharing", "Imaging", "Gaming", "Utilities",
        "Disk Tools", "Development", "Security", "Portable", "Runtimes",
        "Drivers", "Performance", "Privacy", "Fixer", "Personalization",
        "Power", "Protection", "Classic", "GPU Drivers"
    )

    # Get the collection view
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)

    if ($validCategories -contains $Cat) {
        # Apply the filter
        $collectionView.Filter = {
            param ($item)

            # Ensure item structure is valid
            if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
                return $false
            }

            # Filter by category tag
            $tags = $item.Children[0].Children[0].Tag -split " \| "

            return $tags[3] -eq $Cat
        }
    }
    else {
        # Clear filter if category is invalid
        $collectionView.Filter = $null
    }

    # Refresh the view
    $collectionView.Refresh()

    # # Scroll to top if items exist
    # $listView = $itt['window'].FindName($itt.CurrentList)
    # if ($listView.Items.Count -gt 0) {
    #     $itt.AppsListView.ScrollIntoView($listView.Items[0])
    # }
}