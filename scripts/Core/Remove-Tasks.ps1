function Remove-ScheduledTasks {

    param ([Parameter(Mandatory = $true)][array]$tweak)
    
    foreach ($task in $tweak) {
        Add-Log -Message "Removing $task ScheduledTask..." -Level "info"
        $tasks = Get-ScheduledTask -TaskName "*$task*" -ErrorAction SilentlyContinue
        if ($tasks) 
        {
            foreach ($task in $tasks) 
            {
                Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
                Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
            }
        } 
        else
        {
            if ($Debug) 
            {
                Add-Log -Message "No tasks matching '$task' found" -Level "debug"
            }
        }
    }
}