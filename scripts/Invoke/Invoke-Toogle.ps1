function Invoke-Toggle {
    
    Param ([string]$debug)

    Switch -Wildcard ($debug) {
        
        "showfileextensions" { Invoke-ShowFile-Extensions $(Get-ToggleStatus showfileextensions) }
        "darkmode" { Invoke-DarkMode $(Get-ToggleStatus darkmode) }
        "showsuperhidden" { Invoke-ShowFile $(Get-ToggleStatus showsuperhidden) }
        "numlook" { Invoke-NumLock $(Get-ToggleStatus numlook) }
        "stickykeys" { Invoke-StickyKeys $(Get-ToggleStatus stickykeys) }
        "mouseacceleration" { Invoke-MouseAcceleration $(Get-ToggleStatus mouseacceleration) }
        "endtaskontaskbarwindows11" { Invoke-TaskbarEnd $(Get-ToggleStatus endtaskontaskbarwindows11) }
        "clearpagefileatshutdown" { Invoke-ClearPageFile $(Get-ToggleStatus clearpagefileatshutdown) }
        "autoendtasks" { Invoke-AutoEndTasks $(Get-ToggleStatus autoendtasks) }
        "performanceoptions" { Invoke-PerformanceOptions $(Get-ToggleStatus performanceoptions) }
        "launchtothispc" { Invoke-LaunchTo $(Get-ToggleStatus launchtothispc) }
        "disableautomaticdriverinstallation" { Invoke-DisableAutoDrivers $(Get-ToggleStatus disableautomaticdriverinstallation) }
        "AlwaysshowiconsneverThumbnail" { Invoke-ShowFile-Icons $(Get-ToggleStatus AlwaysshowiconsneverThumbnail) }
        "CoreIsolationMemoryIntegrity" { Invoke-Core-Isolation $(Get-ToggleStatus CoreIsolationMemoryIntegrity) }
        "WindowsSandbox" { Invoke-WindowsSandbox $(Get-ToggleStatus WindowsSandbox) }
        "WSL" { Invoke-WindowsSandbox $(Get-ToggleStatus WSL) }
        "HyperV" { Invoke-HyperV $(Get-ToggleStatus HyperV) }
    }
    # debug start
    Add-Log -Message $debug -Level "debug"
    # debug end
}