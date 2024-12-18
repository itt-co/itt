function Native-Downloader {
    param (
        [string]$url,
        [string]$name,
        [string]$launcher,
        [string]$portable,
        [string]$installArgs
    )
        # Define the destination directory
        $Destination_Directory = Join-Path -Path "$env:ProgramData\itt\Downloads" -ChildPath $name
        # Ensure destination directory exists
        if (-not (Test-Path -Path $Destination_Directory)) {
            New-Item -ItemType Directory -Path $Destination_Directory -Force | Out-Null
        }
        # Extract file name and ensure we have the file with extension
        $File = [System.IO.Path]::GetFileName($url)
        $DownloadPath = Join-Path -Path $Destination_Directory -ChildPath $File
        $targetPath = Join-Path -Path $Destination_Directory -ChildPath $launcher
        try {
            # Start downloading the file
            Add-Log -Message "Downloading $name using Invoke-WebRequest" -Level "INFO"
            Invoke-WebRequest -Uri $url -OutFile $DownloadPath -ErrorAction Stop
            Expand-Archive -Path $DownloadPath -DestinationPath $Destination_Directory -Force -ErrorAction Stop
        }
        catch {
            Write-Error "An error occurred during the download or extraction process: $_"
        }
        if($portable -eq "true")
        {
            # Check if the target file exists
            if (-not (Test-Path -Path $targetPath)) {
                Add-Log -Message  "Target file '$targetPath' does not exist after extraction." -Level "error"
                return
            }
            # Define the path to the desktop shortcut
            $desktopPath = [System.Environment]::GetFolderPath('Desktop')
            $shortcutPath = Join-Path -Path $desktopPath -ChildPath "$name.lnk"
            try {
                # Create the shortcut
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($shortcutPath)
                $shortcut.TargetPath = $targetPath
                $shortcut.Save()
                Add-Log -Message "Shortcut created on Destkop" -Level "info"
            } catch {
                Write-Error "Failed to create shortcut. Error: $_"
            }
        }
        else
        {
            Start-Process -FilePath $targetPath -ArgumentList $installArgs -Wait
            if($debug) {Write-Host $targetPath}
        }
}