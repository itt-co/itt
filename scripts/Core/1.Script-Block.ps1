function ITT-ScriptBlock {
    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.
        .DESCRIPTION
        This function creates a new PowerShell instance to execute a provided script block asynchronously. It accepts an optional array of arguments to pass to the script block and manages the runspace and PowerShell instance resources. The function ensures that resources are properly disposed of after the script block completes execution.
        .EXAMPLE
        ITT-ScriptBlock -ScriptBlock { param($arg1) Write-Output $arg1 } -ArgumentList @("Hello, World!")
        Executes the script block that outputs the provided argument "Hello, World!" asynchronously.
    #>
    param(
        [scriptblock]$ScriptBlock,
        [array]$ArgumentList,
        $Debug
    )
    $script:powershell = [powershell]::Create()
    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)
    $script:powershell.AddArgument($ArgumentList)
    $script:powershell.AddArgument($Debug)
    $script:powershell.RunspacePool = $itt.runspace
    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()
    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)
        $script:powershell.Dispose()
        $itt.runspace.Dispose()
        $itt.runspace.Close()
        [System.GC]::Collect()
    }

    return $handle
}