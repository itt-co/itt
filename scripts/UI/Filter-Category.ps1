function Search {

    <#
        .SYNOPSIS
        Filters items in the current list view based on the search input.

        .DESCRIPTION
        The `Search` function retrieves the text from the search input, converts it to lowercase, and removes any non-alphanumeric characters. It then applies a filter to the items in the currently displayed list view based on the search input. The filter checks if the search input matches any checkbox content within stack panels in the list view.

        .EXAMPLE
        Search

        .NOTES
        - The function operates on the `searchInput` property of the `$itt` object, which is expected to be a text input control where users enter their search query.
        - The function uses the `CollectionViewSource` class to get the default view of the items in the current list view and applies a filter to it.
        - The filter logic iterates through the children of each `StackPanel` item, looking for `CheckBox` controls. If the content of a checkbox matches the search input, the item is included in the filtered view.
        - Non-`StackPanel` items are always included in the filtered view.
        - This function relies on the `$itt.currentList` property to determine which list view to filter. Ensure that `$itt.currentList` correctly references the ID of the current list view control.
    #>


    # Retrieves the search input, converts it to lowercase, and filters the list based on the input
    $filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''

    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)
    
    $collectionView.Filter = {
        param($item)
        if ($item -is [System.Windows.Controls.StackPanel]) {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            if ($innerChild.Content -match $filter) {
                                return $true
                            }
                        }
                    }
                }
            }
            return $false
        }
        return $true  # Non-StackPanel items are always included
    }
}
function FilterByCat {

    <#
        .SYNOPSIS
        Filters the items in the Apps list view based on the selected category.

        .DESCRIPTION
        The `FilterByCat` function filters the items displayed in the Apps list view based on a specified category. It updates the view to show only those items that match the selected category. If the selected category is not valid, it clears the filter and displays all items. The function also ensures that the Apps tab is selected and scrolls to the top of the list view after applying the filter.

        .PARAMETER Cat
        The category to filter by. Must be one of the predefined valid categories.

        .EXAMPLE
        FilterByCat -Cat "Media"

        .NOTES
        - The function operates on the `AppsListView` control within the `$itt` object.
        - The `validCategories` array contains the list of categories that the function recognizes as valid. If the provided category does not match one of these, the filter is cleared.
        - The filter predicate is based on checking the `Tag` property of `CheckBox` controls within `StackPanel` items to determine if they match the selected category.
        - If the selected category is valid, the function applies the filter to the `CollectionView` of the `AppsListView`. If not, it removes the filter and shows all items.
        - The `ScrollIntoView` method is used to ensure that the list view scrolls to the top after applying the filter.
    #>


    param ($Cat)

    # Define the list of valid categories
    $validCategories = @(
        "Web Browsers",
        "Media",
        "Media Tools",
        "Documents",
        "Compression",
        "Communication",
        "File Sharing",
        "Imaging",
        "Gaming",
        "Utilities",
        "Disk Tools",
        "Development",
        "Security",
        "Portable",
        "Runtimes",
        "Drivers"
    )

    # Update DataContext
    #$itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)

    # if user is on another tab, return to the apps list
    $itt['window'].FindName('apps').IsSelected = $true
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)

    # Define the filter predicate
    $filterPredicate = {
        param($item)
        
        if ($item -is [System.Windows.Controls.StackPanel]) {
            foreach ($child in $item.Children) {
                if ($child -is [System.Windows.Controls.StackPanel]) {
                    foreach ($innerChild in $child.Children) {
                        if ($innerChild -is [System.Windows.Controls.CheckBox]) {
                            # Define the tag you want to filter by
                            $tagToFilter =  $Cat
                            # Check if the item has the tag
                            $itemTag = $innerChild.Tag
                            return $itemTag -eq $tagToFilter
                        }
                    }
                }
            }
        }
    }

    if ($validCategories -contains $Cat) {
        # Apply the filter to the collection view
        $itt.AppsListView.Clear()
        $collectionView.Filter = $filterPredicate
    }
    else {
        # Clear the filter if selected category is not in the predefined list
        $itt.AppsListView.Clear()
        $collectionView.Filter = $null
    }
    
    # Scroll to the top
    $itt.AppsListView.ScrollIntoView($itt.AppsListView.Items[0])
}
function ClearFilter {

    <#
        .SYNOPSIS
        Clears the filter applied to the Apps list view.

        .DESCRIPTION
        The `ClearFilter` function removes any filtering that has been applied to the items in the Apps list view. It clears the list view and resets the filter, making all items in the list view visible. This function is typically used when you want to display all items without any filtering constraints.

        .EXAMPLE
        ClearFilter

        .NOTES
        - The function operates on the `AppsListView` control within the `$itt` object.
        - The `Clear()` method is called on the `AppsListView` to remove any items currently displayed. This is followed by resetting the `Filter` property of the `CollectionView` associated with the `AppsListView` to `$null`, effectively removing any applied filter and showing all items.
        - This function is useful for resetting the view to its default state, especially after applying a category filter or other types of filters.
    #>

    $itt.AppsListView.Clear()
    $collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)
    $collectionView.Filter = $null
}