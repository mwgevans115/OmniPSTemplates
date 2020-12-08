@{
    PSDependOptions = @{
        Target = '$DependencyFolder\.Dependencies\Modules' # I want all my dependencies installed here
        AddToPath = $True            # I want to prepend project to $ENV:Path and $ENV:PSModulePath
    }

    # Grab some modules
    Pester = 'latest'
    PSScriptAnalyzer = 'latest'

    # Clone a git repo
    'mwgevans115/BuildHelpers' = 'latest'
}