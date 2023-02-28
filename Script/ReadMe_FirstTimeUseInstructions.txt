Report bugs and recommendations to s.sidelinger@beckhoff.com
Steps to use this script program to auto setup PC, install TwinCAT, HMI, and install your program.
Enjoy! 

Step1:
Copy TwinCAT installer to folder: 
*\Script\ProgramsToBeInstalled\TwinCAT3.1\

Copy TwinCAT HMI installer to folder: (Or remove the enable to install TwinCAT HMI from script)
*\Script\ProgramsToBeInstalled\TF2000_HMI\

Download and copy chromium to: (https://www.chromium.org/getting-involved/download-chromium/) HINT: the correct download is just a bunch of raw files, not an installer.
*\Script\ProgramsToBeInstalled\chrome-win\

Copy any Beckhoff supplements that need to be installed to folder. Note, 3rd party installers may also work in this folder.  
*\Script\ProgramsToBeInstalled\supplements\

Step2:
Copy your TwinCAT boot folder from a working system to *\Script\MachineDefaultVarient\TwinCATBootFolder
Copy your TwinCAT HMI boot folder from a working system to *\Script\MachineDefaultVarient\TcHmiProject
Copy your TwinSAFE .bin file to *\Script\MachineDefaultVarient\TwinSAFE   

HINT: HMI stored here: C:\ProgramData\Beckhoff\TF2000 TwinCAT 3 HMI Server\service\TcHmiProject
HINT: TwinCAT boot stored: C:\TwinCAT\3.1\Boot
HINT: twinsafe.bin file is generated from TC3 by right clicking on twinsafe project.

Step3:
Edit Powershell code starting at line ~200 to include extra installers

Step 4: 
Remove Powershell code which copies license to TwinCAT license file. Search for the word "License". You may choose to keep this if you do not have a EL6070 or are running trial licenses like me.

Step 5:
Copy folder with all powershell files to USB stick

Step 6:
Insert in new PC and run StartInstallDefault.cmd

Step 7: New Varients.
See cmd example for Varient A to see how to handle extra varients. 

Finished unless you have TwinSAFE!

Optional - TwinSAFE auto loader. 
TwinSAFE Option 1:
The best approach for most applications is to load the TwinSAFE project via PLC code. In this repository, sample PLC code is added in the TwinSAFE folder to show how to load a twinSAFE program into the safety proessor. The safety program is a .bin file generated from TwinCAT. You target that bin file with the sample code. I will not detail every step but it is possible to get the safety project 100% loaded automaticly so no human intervention is required. Good luck!
I've included a script line that copys the .bin file in the varient folder to the C:\TwinSAFEProgram\. I only did this as a template. However, you could easly just stick it in the TwinCAT boot folder. All that matters is the .bin file makes it onto the PC's hard drive and that your PLC code knows the files location.

TwinSAFE Option 2:
Use twinSAFELoader.exe. If no PLC license is being used then this is your path forward. I've decided not to include how to acomplish this in the script but I beleive it to be 100% possible. 
