Steps to use this script program to auto setup PC, install TwinCAT, HMI, and install your program.
Enjoy! 


Step1:
Copy TwinCAT installer inside folder: 
*\Script\ProgramsToBeInstalled\TwinCAT3.1\

Copy TwinCAT HMI installer inside folder: (Or remove the enable to install TwinCAT HMI from script)
*\Script\ProgramsToBeInstalled\TF2000_HMI\

Download and copy chromium to: (https://www.chromium.org/getting-involved/download-chromium/)
*\Script\ProgramsToBeInstalled\chrome-win\

Step2:
Copy your TwinCAT boot folder from a working system to *\Script\MachineDefaultVarient\TwinCATBootFolder
Copy your TwinCAT HMI boot folder from a working system to *\Script\MachineDefaultVarient\TcHmiProject

HINT: HMI stored here: C:\ProgramData\Beckhoff\TF2000 TwinCAT 3 HMI Server\service\TcHmiProject
HINT: TwinCAT boot stored: C:\TwinCAT\3.1\Boot

Step3:
Edit Powershell code starting at line ~147 to include extra installers

Step 4: Optional - 
Remove Powershell code which copies license to TwinCAT license file. This is done for testing which may be helpful but if using EL6070, this shouldn't be needed and likely cause problems.

Step 5:
Copy folder with all powershell files to USB stick

Step 6:
Insert in new PC and run StartInstallDefault.cmd

Step 7: New Varients.
See cmd example for Varient A to see how to handle extra varients. 