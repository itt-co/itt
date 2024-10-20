function Convert-Locales {
    param (
        [string]$csvFolderPath = "locales", # Path to the folder containing the CSV files
        [string]$jsonOutputPath = "Resources/Database/locales.json" # Path where the generated JSON file will be saved
    )

    # Initialize a hashtable to store the "Controls" object
    $locales = @{
        "Controls" = @{}
    }

    # Get all CSV files in the specified folder and process each one
    Get-ChildItem -Path $csvFolderPath -Filter *.csv | ForEach-Object {
        # Import the content of the current CSV file
        $csvData = Import-Csv -Path $_.FullName

        # Extract the filename without the extension to use as the language key
        $language = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)

        # If the language key doesn't already exist in the Controls object, add it
        if (-not $locales["Controls"].ContainsKey($language)) {
            $locales["Controls"][$language] = @{}
        }

        # Loop through each row of the CSV file and add the key-value pairs to the respective language section
        foreach ($row in $csvData) {
            $locales["Controls"][$language][$row.Key] = $row.Text
        }
    }

    # Convert the hashtable to JSON format and save it to the specified output path
    $locales | ConvertTo-Json -Depth 20 | Set-Content -Path $jsonOutputPath -Encoding UTF8
}