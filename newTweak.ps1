# Function to create JSON structure
function Create-JsonObject {
    $jsonObject = @{
        Name                = ""
        Description         = ""
        Check               = "false"
        Category            = ""
        Refresh             = "false"
        Registry            = @()
        RemoveAppxPackage   = @()
        RemoveTasks         = @()
        InvokeCommand       = @()
        UndoCommand         = @()
    }

    $addRemoveCommands = Read-Host "Do you want to add 'Command' in this tweak? (yes/no)"
    if ($addRemoveCommands -eq "yes") {
        $jsonObject.InvokeCommand += Add-Commands
    }

    # Prompt user to add items to specific properties
    $addRemoveTasks = Read-Host "Do you want to add 'RemoveTasks' in this tweak? (yes/no)"
    if ($addRemoveTasks -eq "yes") {
        $jsonObject.RemoveTasks += Add-RemoveTasks
    }

    $addRegistry = Read-Host "Do you want to add 'Registry'? (yes/no)"
    if ($addRegistry -eq "yes") {
        $jsonObject.Registry += Add-ModifyEntries
    }

    # Prompt user to add Appx packages
    $addRemoveAppxPackage = Read-Host "Do you want to add 'RemoveAppxPackage'? (yes/no)"
    if ($addRemoveAppxPackage -eq "yes") {
        $jsonObject.RemoveAppxPackage += Add-AppxPackage
    }

    return $jsonObject
}

# Function to add Command 
function Add-Commands {
    $Commands = @() # Initialize an array for tasks

    do {
        $cmd = Read-Host "Enter a command"
        $Commands += $cmd
        
        # Ask if the user wants to add another task
        $addAnotherCommand = Read-Host "Do you want to add another command? (yes/no)"
    } while ($addAnotherCommand -eq "yes")

    return $Commands
}

# Function to add tasks to RemoveTasks
function Add-RemoveTasks {
    $tasks = @() # Initialize an array for tasks

    do {
        $task = Read-Host "Enter a task to add to 'RemoveTasks'"
        $tasks += $task
        
        # Ask if the user wants to add another task
        $addAnotherTask = Read-Host "Do you want to add another task? (yes/no)"
    } while ($addAnotherTask -eq "yes")

    return $tasks
}

# Function to add modify entries to Registry
function Add-ModifyEntries {
    $modifyEntries = @() # Initialize an array for Modify entries

    do {
        # Create a new entry for Modify
        $modifyEntry = @{
            Path         = Read-Host "Enter the registry Path"
            Name         = Read-Host "Enter the registry Name"
            Type         = Read-Host "Enter the registry Type"
            Value        = Read-Host "Enter the registry Value"
            DefaultValue = Read-Host "Enter the defaultValue"
        }

        $modifyEntries += $modifyEntry # Add the entry to the Modify array

        # Ask if the user wants to add another Modify entry
        $continue = Read-Host "Do you want to add another Modify entry? (yes/no)"
    } while ($continue -eq "yes")

    return $modifyEntries
}

# Function to add Appx packages
function Add-AppxPackage {
    $appxPackages = @() # Initialize an array for Appx packages

    do {
        $packageName = Read-Host "Enter an Appx package name to add to 'RemoveAppxPackage'"
        $appxPackages += @{ Name = $packageName } # Add the package as an object with the Name property
        
        # Ask if the user wants to add another Appx package
        $addAnotherAppx = Read-Host "Do you want to add another Appx package? (yes/no)"
    } while ($addAnotherAppx -eq "yes")

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
    foreach ($item in $existingJson) {
        $jsonOutput += [PSCustomObject]@{
            Name               = $item.Name
            Description        = $item.Description
            Category           = $item.Category
            Check              = $item.Check
            Refresh            = $item.Refresh
            InvokeCommand      = $item.InvokeCommand
            UndoCommand        = $item.UndoCommand
            Registry           = $item.Registry
            RemoveAppxPackage  = $item.RemoveAppxPackage
            RemoveTasks        = $item.RemoveTasks
        }
    }

    # Write the ordered JSON to the file
    $jsonOutput | ConvertTo-Json -Depth 20 | Out-File -FilePath $outputFilePath -Encoding utf8

    Write-Host "Added successfully to existing JSON file. Don't forget to build and test it before commit" -ForegroundColor Green
} else {
    Write-Host "The file $outputFilePath does not exist!" -ForegroundColor Red
}
