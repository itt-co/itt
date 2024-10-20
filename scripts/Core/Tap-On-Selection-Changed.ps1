function ChangeTap {
    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.

        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface. It uses a hash table to map tab names to their corresponding button visibility settings and list values. The function iterates through the tabs and updates the UI elements accordingly.

        .EXAMPLE
        ChangeTap
        Updates the visibility of the 'installBtn' and 'applyBtn' and sets the 'currentList' property based on the currently selected tab.

        .PARAMETER None
        This function does not take any parameters. It operates on predefined UI elements and settings.

        .NOTES
        Ensure that the `$itt['window']` object and its method `FindName` are correctly implemented and available in the context where this function is used. The function relies on these objects to access and modify UI elements.
    #>
    
    $tabSettings = @{
        'apps'        = @{ 'installBtn' = 'Visible'; 'applyBtn' = 'Hidden'; 'currentList' = 'appslist' }
        'tweeksTab'   = @{ 'installBtn' = 'Hidden'; 'applyBtn' = 'Visible'; 'currentList' = 'tweakslist' }
        'SettingsTab' = @{ 'installBtn' = 'Hidden'; 'applyBtn' = 'Hidden'; 'currentList' = 'SettingsList' }
    }

    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {
        # Check if the current tab is selected
        if ($itt['window'].FindName($tab).IsSelected) {
            $settings = $tabSettings[$tab]
            
            # Update button visibility and currentList based on the selected tab
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt.currentList = $settings['currentList']

            # Debug
            if($Debug) { Add-Log -Message $settings['currentList'] -Level "INFO"}
            
            break  # Exit the loop once the matching tab is found
        }
    }
}
