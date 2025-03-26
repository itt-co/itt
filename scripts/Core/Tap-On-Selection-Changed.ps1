function ChangeTap {

    <#
        .SYNOPSIS
        Updates the visibility of buttons and sets the current list based on the selected tab.
        .DESCRIPTION
        This function manages the visibility of buttons and the selection of lists based on which tab is currently selected in a user interface.
        .EXAMPLE
        ChangeTap
        Updates the visibility of the 'installBtn' and 'applyBtn' and sets the 'currentList' property based on the currently selected tab.
        .NOTES
        Ensure that the `$itt['window']` object and its method `FindName` are correctly implemented and available in the context where this function is used. The function relies on these objects to access and modify UI elements.
    #>

    $tabSettings = @{
            'apps'        = @{ 
            'installBtn' = 'Visible';
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'appslist'; 
            'CurrentCategory' = 'AppsCategory' 
        }
            'tweeksTab'   = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Visible'; 
            'CurrentList' = 'tweakslist'; 
            'CurrentCategory' = 'TwaeksCategory'
        }
        'SettingsTab' = @{ 
            'installBtn' = 'Hidden'; 
            'applyBtn' = 'Hidden'; 
            'CurrentList' = 'SettingsList'
        }
    }
    # Iterate over the tab settings
    foreach ($tab in $tabSettings.Keys) {
        # Check if the current tab is selected
        if ($itt['window'].FindName($tab).IsSelected) {
            $settings = $tabSettings[$tab]
            # Update button visibility and currentList based on the selected tab
            $itt.CurrentList = $settings['CurrentList']
            $itt.CurrentCategory = $settings['CurrentCategory']
            $itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
            $itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
            $itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
            $itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
            break
        }
    }
}