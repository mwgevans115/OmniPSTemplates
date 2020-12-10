#Requires -Modules psake
[cmdletbinding()]
param(
    [ValidateSet('Build','Test','Clean','Analyze','Publish')]
    [string[]]$Task = 'Build'
)
Install-Module PSDepend -Scope CurrentUser -Force
Invoke-PSDepend -Path "$PSScriptRoot\build.requirements.psd1" -Install -Import -Force
Set-BuildEnvironment -Path "$PSScriptRoot\.." -Force
Invoke-psake -buildFile "$PSScriptRoot\build.psake.ps1" -taskList $Task -Verbose:$VerbosePreference
Get-Module | Where-Object {$_.Path -like "$PSScriptRoot*" } | Remove-Module -Force
get-item Env:* -Include "BH*" | Remove-Item