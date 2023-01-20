#############################################################################################################################
## Declare Functions
##########################################################################################################################
    function WriteLog
        {
        Param ([string]$LogString)
        Write-Output  $LogString
        $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm")
        $LogMessage = "$Stamp $LogString"
        Add-content $LogFile -value $LogMessage
        }

    function SaveSettingToFile
        {
        Param ([string]$Progress)
        #Param ([string]$LocalDirectoryProgramsToBeInstalled)
        "Progress=$Progress" | out-file -filepath $($LocalDirectoryProgramsToBeInstalled + '\SavedProgress.txt')
        }

     
function CopyFolderToFolder($ToFolder, $FromFolder, $DeleteFilesInCopyToFolder) 
{   
        #If first char is *, this is a flag to tell the software to use the settings varient folder name for the directory to pull the from files. This makes it easier to maintain varients.
        if($FromFolder.length -ge 1 -and $FromFolder.Substring(0,1) -eq '*'){
            $FromFolder = $($VarientSubFolder + $FromFolder.Trimstart('*'))
        }

        $FolderExist = Test-Path -Path $ToFolder
        if($FolderExist -eq 0){
            New-Item -ItemType Directory -Force -Path $ToFolder
        }

        #Copy entire Folder
        if($FromFolder.length -ge [int]2 -and $ToFolder.length -ge [int]1){
            if($FromFolder.Substring(1,1) -ne ':' ){ #Assume user ment to give a relitive path.
                $FromFolder = $($ScriptDir+ '\' + $FromFolder)
            }
            

            if($DeleteFilesInCopyToFolder -eq '1'){    
                Write-Output  $("Deleting Files in " + $ToFolder)
                Get-ChildItem -Path $ToFolder -Include *.* -File -Recurse | foreach { $_.Delete()}
                                
            }
            $target = Get-Item $FromFolder 
            if($target.PSIsContainer){
                Write-Output  $("Copying Folder Files from " + $FromFolder+ " To " + $ToFolder)
                Copy-Item $($FromFolder + '\*') -Destination $ToFolder -recurse -Force  
            }
            else{
                Write-Output  $("Copying File from " + $FromPath + " To " + $ToFolder)
                CopyFileToFolder $ToFolder $FromFolder
            }

    
        }
 
 }

    function CopyFileToFolder
        {
        Param ([string]$ToFolder, [string]$FromPath)
        $FolderExist = Test-Path -Path $ToFolder
        if($FolderExist -eq 0){
            New-Item -ItemType Directory -Force -Path $ToFolder
        }

       if($FromPath.length -ge [int]5 -and $ToFolder.length -ge [int]5){
          if($FromPath.Substring(1,1) -ne ':' ){ #Assume user ment to give a relitive path.
            $FromPath = $($ScriptDir.TrimEnd('\') + '\' + $FromPath)
            }
            Write-Output  $("Copying File from " + $FromPath+ " To " + $ToFolder)

            Copy-Item $FromPath -Destination $ToFolder     
            WriteLog $("Copy File To Folder: " + $FromPath + " To " +  $ToFolder)
       }
    }

    
    function GetFilePathFromFolder($FolderPath) 
    {   
        $InstallerFileName = Get-ChildItem -Path  $FolderPath -Force -Recurse -File | where Name -NE '.gitignore' |  Select-Object -First 1


        $Result = $FolderPath.TrimEnd('\') + '\' + $InstallerFileName
        if($(Test-Path -Path $Result) -eq 0)#If file or folder does not exist
        {
            Write-Output $("'####################################################################")
            WriteLog $('Error - The following file does not exist: ' + $Result)
            Write-Output $("####################################################################")
            [System.Windows.MessageBox]::Show('Error - The following file does not exist: ' + $Result)
        }       

        return $Result  
 
    }

    function Reboot() 
    {   
        ###Reboot
        $InstallProgress = [int]$InstallProgress + [int]1
        SaveSettingToFile $InstallProgress
        Write-Output $("####################################################################")
        Write-Output $("########################### REBOOT #################################")
        Write-Output $("####################################################################")
        
        WriteLog $("Reboot Started")
        if($EnableDebugMode -ne 1){      
            Start-Sleep -Seconds 5
            Restart-Computer
            Exit
        }
        else{ 
            Write-Output "Debug Mode - Reboot Skipped" 
        }
    }

##########################################################################################################################
## End Declare functions
#############################################################################################################################