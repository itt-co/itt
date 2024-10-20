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

        .EXAMPLE
        Get-SelectedItems -Mode "Tweaks"
        Retrieves and returns a list of selected tweaks from the `TweaksListView`.

        .NOTES
        - The function relies on the `$itt` object, which must be initialized and accessible within the scope of the function.
        - The function processes items from the ListView by iterating through nested StackPanel controls and their child CheckBox controls.
        - The resulting items are returned as an array of hashtables, with each hashtable containing details about the selected item based on the mode.
    #>

    param (
        [string]$Mode
    )

    $items = @()

    switch ($Mode) {
        "Apps" {
            $itt.AppsListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $app = $itt.database.Applications | Where-Object { $_.Name -eq $checkbox.Content }

                                    if ($app) {
                                        $items += @{
                                            Name    = $app.name
                                            Choco   = $app.choco
                                            Winget  = $app.winget
                                            Default = $app.default
                                            # Add a new method downloader here
                                        }
                                    }
                                }
                        }
                }
        }
        "Tweaks" {
            $itt.TweaksListView.Items |
                Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                ForEach-Object {
                    $_.Children |
                        Where-Object { $_ -is [System.Windows.Controls.StackPanel] } |
                        ForEach-Object {
                            $_.Children |
                                Where-Object { $_ -is [System.Windows.Controls.CheckBox] -and $_.IsChecked } |
                                ForEach-Object {
                                    $checkbox = $_
                                    $tweak = $itt.database.Tweaks | Where-Object { $_.Name -eq $checkbox.Content }

                                    if ($tweak) {
                                        $items += @{
                                            Name                = $tweak.Name
                                            Type                = $tweak.Type
                                            Modify              = $tweak.Modify
                                            Delete              = $tweak.Delete
                                            Service             = $tweak.Service
                                            RemoveAppxPackage   = $tweak.RemoveAppxPackage
                                            Command             = $tweak.InvokeCommand
                                            Refresh             = $tweak.Refresh
                                            # Add a new method tweak here
                                        }
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