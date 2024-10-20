function Invoke-ScriptBlock {
    <#
        .SYNOPSIS
        Executes a given script block asynchronously within a specified runspace.

        .DESCRIPTION
        This function creates a new PowerShell instance to execute a provided script block asynchronously. It accepts an optional array of arguments to pass to the script block and manages the runspace and PowerShell instance resources. The function ensures that resources are properly disposed of after the script block completes execution.

        .PARAMETER ScriptBlock
        The script block to be executed. This parameter is mandatory and must be of type `[scriptblock]`.

        .PARAMETER ArgumentList
        An optional array of arguments to be passed to the script block. This parameter allows for dynamic input to the script block.

        .EXAMPLE
        Invoke-ScriptBlock -ScriptBlock { param($arg1) Write-Output $arg1 } -ArgumentList @("Hello, World!")
        Executes the script block that outputs the provided argument "Hello, World!" asynchronously.

        .NOTES
        - The function uses a custom runspace (`$itt.runspace`) for execution. Ensure that this runspace is correctly configured and available in the script's context.
        - Proper disposal of the PowerShell instance and runspace is handled to prevent resource leaks.
        - Garbage collection is explicitly invoked to free up memory after execution.
    #>

    param(
        [scriptblock]$ScriptBlock,  # The script block to invoke
        [array]$ArgumentList,
        $Debug   
    )

    $script:powershell = [powershell]::Create()  # Create a new PowerShell instance

    # Add the script block and arguments to the runspace
    $script:powershell.AddScript($ScriptBlock)
    $script:powershell.AddArgument($ArgumentList)
    $script:powershell.AddArgument($Debug)
    $script:powershell.RunspacePool = $itt.runspace  # Set the runspace pool

    # Begin running the script block asynchronously
    $script:handle = $script:powershell.BeginInvoke()

    # If the script has completed, clean up resources
    if ($script:handle.IsCompleted) {
        $script:powershell.EndInvoke($script:handle)  # End the invocation
        $script:powershell.Dispose()                  # Dispose of the PowerShell instance
        $itt.runspace.Dispose()                      # Dispose of the runspace
        $itt.runspace.Close()                        # Close the runspace
        [System.GC]::Collect()                        # Force garbage collection to free memory
    }
}
