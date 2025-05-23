function Find-Driver {
   
    $gpuInfo = Get-CimInstance Win32_VideoController | Where-Object { $_.Status -eq "OK" } | Select-Object -First 1 -ExpandProperty Name
    $encodedName = [System.Web.HttpUtility]::UrlEncode($gpuInfo) -replace '\+', '%20'

    if (-not $gpuInfo) {
        Write-Host "No GPU detected"
    }


    if ($gpuInfo -match "NVIDIA") {
        Start-Process "https://www.nvidia.com/en-us/drivers/"
    }
    elseif ($gpuInfo -match "AMD" -or $gpuInfo -match "Radeon") {
        Start-Process "https://www.amd.com/en/support/download/drivers.html"
    }
    elseif ($gpuInfo -match "Intel") {
        Start-Process "https://www.intel.com/content/www/us/en/search.html?ws=idsa-suggested#q=$encodedName&sort=relevancy&f:@tabfilter=[Downloads]"
    }
    
}