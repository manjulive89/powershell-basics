#!/usr/bin/env pwsh

# This file contains a basic structure for a PowerShell application.

param(
    [Parameter(Mandatory=$True)]
    [string]
    $MandatoryParam,

    [string]
    $OptionalParam = '',

    [switch]
    $SwitchParam
)

# Stop on every error
$script:ErrorActionPreference = 'Stop'

try {
    #
    # Application code here
    #
}
catch {
    function LogError([string] $exception) {
        Write-Host -ForegroundColor Red $exception
    }

    # IMPORTANT: We compare type names(!) here - not actual types. This is important because - for example -
    #   the type 'Microsoft.PowerShell.Commands.WriteErrorException' is not always available (most likely
    #   when Write-Error has never been called).
    if ($_.Exception.GetType().FullName -eq 'Microsoft.PowerShell.Commands.WriteErrorException') {
        # Print error messages (without stacktrace)
        LogError $_.Exception.Message
    }
    else {
        # Print proper exception message (including stack trace)
        # NOTE: We can't create a catch block for "RuntimeException" as every exception
        #   seems to be interpreted as RuntimeException.
        if ($_.Exception.GetType().FullName -eq 'System.Management.Automation.RuntimeException') {
            LogError "$($_.Exception.Message)$([Environment]::NewLine)$($_.ScriptStackTrace)"
        }
        else {
            LogError "$($_.Exception.GetType().Name): $($_.Exception.Message)$([Environment]::NewLine)$($_.ScriptStackTrace)"
        }
    }

    exit 1
}
