# Compatible with Creators/Anniversary update and later

Function EscapePathForWsl($path) {
    return [regex]::replace($path ,
                            '^(?<drive_letter>[a-zA-Z]):(?<path>.*)$',
                            { '/mnt/{0}{1}' -f $args[0].Groups['drive_letter'].Value.ToLower(), $args[0].Groups['path'].Value })
}

Function BuildWslCommand($commandArgs) {
    $wslSafeArgs = New-Object System.Collections.Generic.List[System.Object]
    ForEach ($var in Get-ChildItem env:*) {
        # Currently passing only ansible-related environment variables
        If ($var.Name -Match 'ANSIBLE') {
            $safeValue = EscapePathForWsl $var.Value
            $wslVarDefinition = '{0}="{1}"' -f $var.Name, $safeValue
            $wslSafeArgs.Add($wslVarDefinition)
        }
    }

    ForEach ($arg In $commandArgs) {
        # Handling path mapping, lowering drive letters, etc.
        $safeArg = $arg -replace '\\', '/' 
        $safeArg = EscapePathForWsl $safeArg
        
        # In bash you can safely wrap everything into quotes, including command name. Any quotes passed to PowerShell were escaped by initial parsing
        $safeArg = "`"${safeArg}`""

        # Handling escaping double quotes in order to be handled properly by bash.exe -c '<command>'
        $safeArg = $safeArg -replace '"', '\"' 
         
        $wslSafeArgs.Add($safeArg)
    }

    return $wslSafeArgs
}

Function GetBashExe() {
  If ([Environment]::Is64BitOperatingSystem) {
      Return 'bash.exe'
  } Else {
      Return "${env:\windir}\Sysnative\bash.exe"
  }
}


$bash = GetBashExe
$wslSafeArgs = @(BuildWslCommand $args)  # Safe cast to array to prevent problems with one-element arrays returned by functions

# Create the final command for bash.exe
$wslCommand = $wslSafeArgs -join " "
Write-Debug "Bash executable: $bash"
Write-Debug "Executing command in WSL bash: $wslCommand"
&$bash -c $wslCommand