function Start-DownloadAndUnzip {
    
    <#
    .SYNOPSIS
    Downloads a ZIP file from a URL, extracts its contents to a specified directory, and optionally creates a shortcut and runs an executable.

    .DESCRIPTION
    This function downloads a ZIP file from the provided URL, extracts the contents to a specified destination directory, and optionally creates a shortcut to an executable file on the desktop. It can also run the executable with optional arguments. The function includes error handling and logging to track the process.

    .PARAMETER url
    The URL of the ZIP file to be downloaded. This is a required parameter.

    .PARAMETER destinationDir
    The directory where the ZIP file will be downloaded and extracted. The default is "C:\ProgramData\ITT\Downloads".

    .PARAMETER Createshortcut
    Specifies whether to create a shortcut to the executable file. Accepts "yes" or "no". Default is not specified.

    .PARAMETER exeFileName
    The name of the executable file to create a shortcut for. This parameter is required if `Createshortcut` is set to "yes".

    .PARAMETER run
    Specifies whether to run the executable after extraction. Accepts "yes" or "no". Default is not specified.

    .PARAMETER exeArgs
    Arguments to be passed to the executable when it is run. This parameter is optional.

    .EXAMPLE
    Start-DownloadAndUnzip -url "http://example.com/file.zip" -destinationDir "C:\Temp" -Createshortcut "yes" -exeFileName "setup.exe" -run "yes" -exeArgs "/silent"
    Downloads the ZIP file from the specified URL, extracts it to "C:\Temp", creates a shortcut to "setup.exe" on the desktop, and runs the executable with the "/silent" argument.
    #>

    param (
        [string]$url,
        [string]$destinationDir = "C:\ProgramData\ITT\Downloads",
        [string]$Createshortcut,
        [string]$exeFileName,
        [string]$run,
        [string]$exeArgs
    )

    # Ensure destination directory exists
    if (-not (Test-Path -Path $destinationDir)) {
        New-Item -ItemType Directory -Path $destinationDir -Force
    }

    # Define paths
    $zipFileName = [System.IO.Path]::GetFileName($url)
    $downloadPath = [System.IO.Path]::Combine($destinationDir, $zipFileName)
    $exePath = [System.IO.Path]::Combine($destinationDir, $exeFileName)
    
    # Create the shortcut name based on the .exe file name
    $shortcutName = [System.IO.Path]::GetFileNameWithoutExtension($exeFileName) + ".lnk"
    $desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), $shortcutName)

    try {
        Add-Log -Message "Downloading using Invoke-WebRequest" -Level "INFO"
        Invoke-WebRequest -Uri $url -OutFile $downloadPath

        # Extract the file
        Write-Output "Extracting file to: $destinationDir"
        Expand-Archive -Path $downloadPath -DestinationPath $destinationDir -Force

        #create a shortcut
        if ($Createshortcut -eq "yes") {
            if (Test-Path -Path $exePath) {
                Write-Output "Creating shortcut at: $desktopPath"
                # Create a shortcut on the desktop
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($desktopPath)
                $shortcut.TargetPath = $exePath
                $shortcut.Save()
                Write-Output "Shortcut created successfully."
                Add-Log -Message "Saved in $downloadPath" -Level "INFO"
            } else {
                Write-Error "The specified .exe file '$exeFileName' was not found in the extracted content."
            }
        }

        # Optionally run the executable
        if ($run -eq "yes") {
            Write-Output "Starting installation"
            Start-Process -FilePath $exePath -ArgumentList $exeArgs -NoNewWindow
        }
    } catch {
        Write-Error $_.Exception.Message
    }
}

function Start-DownloadAndInstallExe {
    <#
    .SYNOPSIS
    Downloads an executable file from a URL, optionally creates a shortcut on the desktop, and runs the executable.

    .DESCRIPTION
    This function downloads an executable file from the specified URL to a designated output directory. Optionally, it can create a shortcut to the executable file on the desktop and run the executable with provided arguments. The function includes error handling and logging to track the process.

    .PARAMETER name
    The name of the executable file to be downloaded. This is used to define the destination path and the shortcut name.

    .PARAMETER url
    The URL of the executable file to be downloaded. This parameter is required.

    .PARAMETER type
    The file extension of the executable file (e.g., "exe"). This helps in naming the file correctly upon download.

    .PARAMETER exeArgs
    Arguments to be passed to the executable when it is run. This parameter is optional.

    .PARAMETER outputDir
    The directory where the executable file will be downloaded. This is a subdirectory under `$env:ProgramData`. This parameter is required.

    .PARAMETER shortcut
    Specifies whether to create a shortcut to the executable on the desktop. Accepts "yes" or "no". Default is "no".

    .PARAMETER run
    Specifies whether to run the executable after downloading. Accepts "yes" or "no". Default is "no".

    .EXAMPLE
    Start-DownloadAndInstallExe -name "ExampleApp" -url "http://example.com/exampleapp.exe" -type "exe" -exeArgs "/silent" -outputDir "Installers" -shortcut "yes" -run "yes"
    Downloads the executable from the specified URL, saves it to `C:\ProgramData\Installers\ExampleApp\ExampleApp.exe`, creates a shortcut to the executable on the desktop, and runs the executable with the `/silent` argument.

    #>

    param (
        [string]$name,
        [string]$url,
        [string]$type,
        [string]$exeArgs,
        [string]$outputDir,
        [string]$shortcut,
        [string]$run
    )

    $destination = "$env:ProgramData\$outputDir\$name\$name.$type"
    $shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), "$name.lnk")

    Add-Log -Message "Downloading using Invoke-WebRequest" -Level "INFO"

    try {
        # Create the output directory if it doesn't exist
        if (-not (Test-Path -Path (Split-Path -Path $destination -Parent))) {
            New-Item -ItemType Directory -Path (Split-Path -Path $destination -Parent) | Out-Null
        }
        # Download the file
        Invoke-WebRequest -Uri $url -OutFile $destination
        Add-Log -Message "Downloaded any saved in $destination " -Level "INFO"

        if ($shortcut -eq "yes") {
            # Create a shortcut on the desktop
            $shell = New-Object -ComObject WScript.Shell
            $shortcut = $shell.CreateShortcut($shortcutPath)
            $shortcut.TargetPath = $destination
            $shortcut.Save()
            Add-Log -Message "Saved in $downloadPath" -Level "INFO"
            Add-Log -Message "Shortcut created on desktop" -Level "INFO"
        }
        if ($run -eq "yes") {
            Start-Process -Wait $destination -ArgumentList $exeArgs
        }
    }
    catch {
        throw "Error downloading EXE file: $_"
    }
}