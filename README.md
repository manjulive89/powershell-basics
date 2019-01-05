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
