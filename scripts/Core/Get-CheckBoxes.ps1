function Get-SelectedItems {

    <#
        .SYNOPSIS
        Retrieves selected items from the ListView based on the specified mode.
        .DESCRIPTION
        This function collects information about selected items from a ListView, depending on the mode specified. It extracts data from the ListView items that have checkboxes that are checked and returns this information in a structured format.
        .PARAMETER Mode
        Specifies the mode for item retrieval. Options include:
        - `Apps`: Retrieves information about selected applications from the `AppsListView`.
        - `Tweaks`: Retrieves information about selected tweaks from the `TweaksListView`.
        .EXAMPLE
        Get-SelectedItems -Mode "Apps"
        Retrieves and returns a list of selected applications from the `AppsListView`.
    #>
    
    param (
        [string]$Mode
    )

    switch ($Mode) {
        "Apps" {

            $items = @()  

            foreach ($item in $itt.AppsListView.Items) {
                
                $child = $item.Children[0].Children[0]
                
                if ($child.IsChecked -eq $true) {

                    if ($appsDict.ContainsKey($child.Content)) {

                        $items += @{
                            Name    = $appsDict[$child.Content].Name
                            Choco   = $appsDict[$child.Content].Choco
                            Winget  = $appsDict[$child.Content].Winget
                            Default = $appsDict[$child.Content].Default
                            # Add a new download mothed here
                        }
                    }
                }
            }
        }
        "Tweaks" {

            $items = @()  

            foreach ($item in $itt.TweaksListView.Items) {
                
                $child = $item.Children[0].Children[0]
                
                if ($child.IsChecked -eq $true) {

                    if ($tweaksDict.ContainsKey($child.Content)) {

                        $items += @{

                            Name          = $tweaksDict[$child.Content].Name
                            Registry      = $tweaksDict[$child.Content].Registry
                            Services      = $tweaksDict[$child.Content].Services
                            ScheduledTask = $tweaksDict[$child.Content].ScheduledTask
                            AppxPackage   = $tweaksDict[$child.Content].AppxPackage
                            Script        = $tweaksDict[$child.Content].Script
                            UndoScript    = $tweaksDict[$child.Content].UndoScript
                            Refresh       = $tweaksDict[$child.Content].Refresh
                            # Add a new tweak method here
                        }
                    }
                }
            }
        }
        default {
            Write-Error "Invalid Mode specified. Please choose 'Apps' or 'Tweaks'."
        }
    }
    return $items
}