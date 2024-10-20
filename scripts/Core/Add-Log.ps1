function Add-Log {

    param (
        [string]$Message, # Content of Message
        [string]$Level = "INFO" # Message Level [INFO] [ERROR] [WARNING],
    )

    $timestamp = Get-Date -Format "hh:mm tt"

    # Determine the color based on the log level
    switch ($Level.ToUpper()) {
        "INFO" { $color = "White" }
        "WARNING" { $color = "Yellow" }
        "ERROR" { $color = "Red" }
        "Installed" { $color = "White" }
        "Apply" { $color = "White" }
        default { $color = "White" }
    }

    switch ($Level.ToUpper()) {
        "INFO" { $icon = "+" }
        "WARNING" { $icon = "!" }
        "ERROR" { $icon = "X" }
        "Installed" { $icon = "√" }
        "Apply" { $icon = "√" }
        "Disabled" { $icon = "X" }
        "Enabled" { $icon = "√" }
        default { $icon = "!" }
    }

    # Construct the log message
    $logMessage =  "[$icon] $Message"

    # Write the log message to the console with the specified color
    Write-Host " $logMessage" -ForegroundColor $color

}