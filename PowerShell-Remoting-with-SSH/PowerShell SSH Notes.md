# PowerShell Remoting  

## Invoke-Command  

___

## Enter-PSSesion  

___

## -ComputerName Parameter

## WinRM  

Uses Ports http on 5985, https on 5986  
Needs to be configured on all client machines
Default on servers  
Supports advanced client configuration  
Windows Only

Enabled by:  

* winrm quick config (Issues with NIC on Public network)
* enable-psremoting (-SkipNetworkProfileCheck bypasses the Public Network issue)  

Uses the following parameters to connect to remote machine:  

* ComputerName  
* UserName  
* KeyFilePath

___

## SSH  

Does not support advanced remote client configuration (ie JEA)  
Windows, Linux, MAC  

Uses the following parameters to cnnect to remote machine:  

* HostName  
* UserName  
* KeyFilePath

___

## Supporting Links  

https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7

https://docs.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management  

https://support.microsoft.com/en-us/help/2019527/how-to-configure-winrm-for-https

___