

# Pre Initialize 
    $scriptPath = $MyInvocation.MyCommand.Path #Get script location and name. Used later on to know if this was executed on a flash disk or not. 
    $Scriptdir = Split-Path $scriptPath
    $scriptName = Split-Path $scriptPath -leaf
    $Logfile = $($Scriptdir + "\proc_$env:computername.log")
    function WriteLog
        {
        Param ([string]$LogString)
        $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm")
        $LogMessage = "$Stamp $LogString"
        Add-content $LogFile -value $LogMessage
        }
    
    function SaveSettingToFile
        {
        Param ([string]$Progress)
        "Progress=$Progress" | out-file -filepath $($LocalDirectoryProgramsToBeInstalled + '\SavedProgress.txt')
            #"$Progress, $Speed, $Regcheck" | out-file -filepath C:\temp\scripts\pshell\dump.txt -append -width 200
        }

    Get-Content ($Scriptdir + '\' + "settings.txt") | foreach-object -begin {$h=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True -And $k[0].StartsWith("#") -ne $True)) { $h.Add($k[0], $k[1]) } }
    Write-OUtput "The following settings have been found"
    $h
     $SubFolderProgramsToBeInstalled = $h.'SubFolderProgramsToBeInstalled' #Name of the sub folder in the directory the script is contained that holds all the programs that need to be installed
    $LocalDirectoryProgramsToBeInstalled = $h.'LocalDirectory' #"C:\ProgramsToBeInstalled" #Directory where the files from the USB stick are to be copied. This way the customer can pull the stick from the PC after the process has started  
    $StartupFolderLocation = $h.'StartupFolderLocation'



    WriteLog "Reset Install Progress"

    
    Write-OUtput $("Install Progress " + $Env:InstallProgress)


    SaveSettingToFile 0

    [Console]::ReadKey()
  