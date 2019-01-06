# PowerShell Basics and Snippets

## Specifying Value for Switch Parameter

```powershell
.\script.ps1 -SwitchParam:$false
```

## Required Parameters

```powershell
param(
    [Parameter(Mandatory=$True)]
    [string] $ProjectName
)
```

## Multi-line Strings

```powershell
$str = @"
This string
is multi-line.
"@
```

## Change Working Directory

```powershell
try {
    Push-Location
    Set-Location $newDir
}
finally {
    Pop-Location
}
```

## Static Method of .NET Type

```powershell
[string]::IsNullOrWhiteSpace($someString)
```

## Module Loading

**Note:** When using modules, you should also use `Unload-Modules.ps1` from this repository.

```powershell
Import-Module "$PSScriptRoot/MyModule.psm1" -DisableNameChecking
```

## Read Registry Value

```powershell
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion' 'ProgramFilesDir'
```

## PowerShell Version

```powershell
$PSVersionTable.PSVersion
```
