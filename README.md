# About This Repository
Script that is executed a single time from a new Beckhoff PC. 
  
The script will:  
  
Insert .bat file into the windows startup folder  
Uninstall current TwinCAT  
Reboot  
Install TwinCAT  
Install HMI  
Install Chromium  
Install Supplements: IE: OPC UA Server.
Insert license file  
Insert Boot project  
Insert HMI project  
Copy TwinSAFE bin file to local directory  
Reboot  
Set auto start TwinCAT to true  
Set local IP address  
Remove .bat file from startup folder  
Reboot  
  
Log everything the script did along the way

# How to get support
Read the .txt instructions text file inside the script folder.

#Auto deploy TwinCAT
Added some sample code on how to handle downloading TwinSAFE project automaticly via PLC code. 
