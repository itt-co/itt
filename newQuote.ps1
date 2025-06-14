param (
    [string]$json = "./static/Database/Quotes.json"
)
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
try {
    # Read existing JSON file
    $jsonFilePath = $json
    $existingData = Get-Content $jsonFilePath -Raw -ErrorAction Stop | ConvertFrom-Json
    $QuotesList = @{
        # Available options
        1 = "quote"
        2 = "info" 
        3 = "music"
    }
    # Prompt user to choose mothed
    do {
        Write-Host "Select text type"
        foreach ($key in $QuotesList.Keys | Sort-Object) {
            Write-Host "$key - $($QuotesList[$key])"
        }
        $choice = Read-Host "Enter the number corresponding to the methods"
        if ([int]$choice -in $QuotesList.Keys) {
            $type = $QuotesList[[int]$choice]
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    } until ([int]$choice -in $QuotesList.Keys)
      # Prompt for input
      $text = Read-Host "Enter text"
      $name = Read-Host "Enter author name or source -You can skip this"
        # Store input
        $Quotes = @{
            type = $type
            text  = $text
    }
    # Add name only if it's not empty
    if (-not [string]::IsNullOrWhiteSpace($name)) {
        $Quotes.name = $name
    }
    # Add new software object to existing array
    $existingData.Quotes += $Quotes
    # Write updated JSON to file
    $existingData | ConvertTo-Json -Depth 4 | Out-File $jsonFilePath -ErrorAction Stop
}
catch {
    Write-Host "An error occurred: $_"
}
finally {
    Write-Host "Added successfully, Don't forget to build and test it before PR!" -ForegroundColor Green 
}