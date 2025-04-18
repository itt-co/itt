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
    
    param ([string]$Mode)

    switch ($Mode) {
        "Apps" {

            $items = @()  

            foreach ($item in $itt.AppsListView.Items) {
                
                $checkbox = $item.Children[0].Children[0]
                $choco = $item.children[1].Text
                $winget = $item.children[2].Text
                $itt = $item.children[3].Text

                if ($checkbox.IsChecked) {

                    $items += @{
                        Name    = $checkbox.Content
                        Choco   = $choco
                        Winget  = $winget
                        ITT     = $itt
                        # Add a new download mothed here
                    }
                }
            }
        }
        "Tweaks" {

            $items = @()  

            foreach ($item in $itt.TweaksListView.Items) {
                
                $child = $item.Children[0].Children[0]

                if ($tweaksDict.ContainsKey($child.Content) -and $child.IsChecked) {

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
    return $items
}