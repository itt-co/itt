Write-Host "
+-------------------------------------------------------------------------+
|    ___ _____ _____   ____    _  _____  _    ____    _    ____  _____    |
|   |_ _|_   _|_   _| |  _ \  / \|_   _|/ \  | __ )  / \  / ___|| ____|   |
|    | |  | |   | |   | | | |/ _ \ | | / _ \ |  _ \ / _ \ \___ \|  _|     |
|    | |  | |   | |   | |_| / ___ \| |/ ___ \| |_) / ___ \ ___) | |___    |
|   |___| |_|   |_|   |____/_/   \_\_/_/   \_\____/_/   \_\____/|_____|   |
|    Made with ♥  By Emad Adel                                            |
+-------------------------------------------------------------------------+
"
# Function to create JSON structure
function Create-JsonObject {
    $Name = Read-Host "Tweak name"
    $Description  = Read-Host "Description"
    $jsonObject = @{
        Name                = $Name
        Description         = $Description
        Check               = "false"
        Category            = ""
        Refresh             = "false"
        Registry            = @()
        AppxPackage         = @()
        ScheduledTask       = @()
        Script              = @()
        UndoScript          = @()
        Services            = @()
    }

    $jsonObject.Category += Category


    $addRemoveCommands = Read-Host "Do you want to add 'Command' in this tweak? (y/n)"

    if ($addRemoveCommands -eq "y") {
        $jsonObject.Script += Add-Commands
    }


    # Prompt user to add items to specific properties
    $addRemoveTasks = (Read-Host "Do you want to add 'Remove ScheduledTask' in this tweak? (y/n)").ToLower()
    
    if ($addRemoveTasks -eq "y") {
        $jsonObject.ScheduledTask += Add-RemoveTasks
    }

    $addRegistry = Read-Host "Do you want to Modify 'Registry' in this tweak? (y/n)"
    if ($addRegistry -eq "y") {
        $jsonObject.Registry += Add-Registry
    }
    # Prompt user to add Appx packages
    $addRemoveAppxPackage = Read-Host "Do you want to Remove 'AppxPackage' in this tweak? (y/n)"
    if ($addRemoveAppxPackage -eq "y") {
        $jsonObject.AppxPackage += Add-AppxPackage
    }
    $addServices = Read-Host "Do you want to add 'Services' in this tweak? (y/n)"
    if ($addServices -eq "y") {
        $jsonObject.Services += Add-Services
    }
    return $jsonObject
}
function Category {
    # category
    $ActionType = @{
        1 = "Privacy"
        2 = "Fixer"
        3 = "Performance"
        4 = "Personalization"
        5 = "Power"
        6 = "Protection"
        7 = "Classic"
    }
    do {
        Write-Host "Which category will this tweak belong to?"
        foreach ($key in $ActionType.Keys | Sort-Object) {
            Write-Host "$key - $($ActionType[$key])"
        }
        $choice = Read-Host "Enter the number corresponding to the Tweak Type"
        if ([int]$choice -in $ActionType.Keys) {
            $category = $ActionType[[int]$choice]
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    } until ([int]$choice -in $ActionType.Keys)
    # category
    return $category
}
# Function to add Command 
function Add-Commands {
    $Commands = @() # Initialize an array for tasks
    do {
        $cmd = Read-Host "Enter a command"
        $Commands += $cmd
        # Ask if the user wants to add another task
        $addAnotherCommand = Read-Host "Do you want to add another command? (y/n)"
    } while ($addAnotherCommand -eq "y")
    return $Commands
}
# Function to add tasks to RemoveTasks
function Add-RemoveTasks {
    $tasks = @() # Initialize an array for tasks
    do {
        $task = Read-Host "Enter ScheduledTask name"
        $tasks += $task
        # Ask if the user wants to add another task
        $addAnotherTask = Read-Host "Do you want to add another task? (yes/no)"
    } while ($addAnotherTask -eq "yes")
    return $tasks
}
# Function to add Services
function Add-Services {
    $ServicesEntries = @() # Initialize an array 
    do {
    # StartupType
        $StartupType = @{
            1 = "Disabled"
            2 = "Automatic"
            4 = "Manual "
        }
        do {
            Write-Host "Which category will this tweak belong to?"
            foreach ($key in $StartupType.Keys | Sort-Object) {
                Write-Host "$key - $($StartupType[$key])"
            }
            $choice = Read-Host "Enter the number corresponding to the Tweak Type"
            if ([int]$choice -in $StartupType.Keys) {
                $type = $StartupType[[int]$choice]
            } else {
                Write-Host "Invalid choice. Please select a valid option."
            }
        } until ([int]$choice -in $StartupType.Keys)
    # StartupType
    # Create a new entry for Modify
    $Services = @{
        Name         = Read-Host "Enter Service name"
        StartupType  = $type
        DefaultType  = "Manual"
    }
    $ServicesEntries += $Services # Add the entry to the array
        # Ask if the user wants to add another Modify entry
        $continue = Read-Host "Do you want to add another Service entry? (y/n)"
    } while ($continue -eq "y")
    return $ServicesEntries
}
# Function to add modify entries to Registry
function Add-Registry {
    $modifyEntries = @() # Initialize an array
    do {
        # ValueType
            $ValueType = @{
                1 = "DWord"
                2 = "Qword"
                3 = "Binary"
                4 = "String"
                5 = "MultiString"
                6 = "ExpandString"
                7 = "LINK"
                8 = "NONE"
                9 = "QWORD_LITTLE_ENDIAN"
            }
            do {
                Write-Host "What is the value type"
                foreach ($key in $ValueType.Keys | Sort-Object) {
                    Write-Host "$key - $($ValueType[$key])"
                }
                $choice = Read-Host "Enter the number corresponding to the Tweak Type"
                if ([int]$choice -in $ValueType.Keys) {
                    $type = $ValueType[[int]$choice]
                } else {
                    Write-Host "Invalid choice. Please select a valid option."
                }
            } until ([int]$choice -in $ValueType.Keys)
        # ValueType
        # Create a new entry for Registry
        $modifyEntry = @{
            Path         = Read-Host "Enter Path"
            Name         = Read-Host "Enter value Name"
            Type         = $type
            Value        = Read-Host "Enter Value"
            DefaultValue = Read-Host "Enter  Default Value"
        }
        $modifyEntries += $modifyEntry # Add the entry to the Modify array
        # Ask if the user wants to add another Modify entry
        $continue = Read-Host "Do you want to add another Modify entry? (y/n)"
    } while ($continue -eq "y")
    return $modifyEntries
}
# Function to add Appx packages
function Add-AppxPackage {
    $appxPackages = @() # Initialize an array for Appx packages
    do {
        $packageName = Read-Host "Enter Appx package name'"
        $appxPackages += $packageName 
        # Ask if the user wants to add another Appx package
        $addAnotherAppx = Read-Host "Do you want to add another Appx package? (y/n)"
    } while ($addAnotherAppx -eq "y")
    return $appxPackages
}
# Main script execution
$outputFilePath = "./static/Database/Tweaks.json"
# Check if the JSON file exists
if (Test-Path $outputFilePath) {
    # Read existing JSON file
    $existingJson = Get-Content -Path $outputFilePath -Raw | ConvertFrom-Json
    # Create a new JSON object to add
    $newJsonObject = Create-JsonObject
    # Append the new object to the existing JSON structure
    $existingJson += $newJsonObject
    # Convert back to JSON format while maintaining the property order
    $jsonOutput = @()
    $excludedIfEmpty = @("Script", "UndoScript", "ScheduledTask", "AppxPackage", "Services", "Registry")
    foreach ($item in $existingJson) {
        $entry = [ordered]@{}
    
        $entry["Name"]        = $item.Name
        $entry["Description"] = $item.Description
        $entry["Category"]    = $item.Category
        $entry["Check"]       = $item.Check
        $entry["Refresh"]     = $item.Refresh
    
        foreach ($key in $excludedIfEmpty) {
            $value = $item.$key
            if ($null -ne $value -and $value.Count -gt 0) {
                $entry[$key] = $value
            }
        }
    
        $jsonOutput += [PSCustomObject]$entry
    }
    # Write the ordered JSON to the file
    $jsonOutput | ConvertTo-Json -Depth 20 | Out-File -FilePath $outputFilePath -Encoding utf8
    Write-Host "Added successfully to existing JSON file. Don't forget to build and test it before PR!" -ForegroundColor Green
} else {
    Write-Host "The file $outputFilePath does not exist!" -ForegroundColor Red
}