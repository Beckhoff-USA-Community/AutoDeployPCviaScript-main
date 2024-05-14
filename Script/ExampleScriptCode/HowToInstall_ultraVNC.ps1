
WriteLog $("Install Ultra VNC using ultravnc.ini setup file")  #currently vnc installer is not occuring silently.
Start-Process $($Scriptdir + '\' + $SubFolderProgramsToBeInstalled +'\' + "Misc\UltraVNC_1_3_42_X86_Setup.exe") -argumentlist '/loadinf=vnccfg.inf /silent /log' -Wait
