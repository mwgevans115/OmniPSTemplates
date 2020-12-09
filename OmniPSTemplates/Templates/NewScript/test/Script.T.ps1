Describe 'Top-level Script Tests' {
    BeforeAll {
        $ScriptName = '<%=$PLASTER_PARAM_ScriptName%>.ps1'
        $ScriptDirectory = "$PSScriptRoot\..\src"
        [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
        $ScriptPath = "$ScriptDirectory\$ScriptName"
    }
    It 'Passes Test-ScriptFileInfo' {
        Test-ScriptFileInfo -Path $ScriptPath
        $? | Should -Be $true
    }
    It 'Is a single file' {
        $Files = Get-ChildItem $ScriptDirectory -Recurse
        $Files.Count | Should -be 1
    }
}