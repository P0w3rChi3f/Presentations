$creds = Get-Credential desktop-52ina1a\honey

# WSMan Configs
Get-ChildItem WSMan:\localhost\Shell
Get-ChildItem WSMan:\localhost\Service\

# Enable Remote PowerShell
Test-WSMan
Get-PSSessionConfiguration
winrm quickconfig
Enable-PSRemoting -SkipNetworkProfileCheck -Verbose

# Enter-PSSession
enter-pssession localhost
enter-pssession DESKTOP-52INA1A -Credential $creds

# Invoke-command
Invoke-Command -computerName localhost, DESKTOP-52INA1A  -Credential $creds `
    -command { Get-EventLog Security | where {$_.eventID -eq 4826}}

# Sessions
$sessions = New-PSSession -ComputerName localhost, DESKTOP-52INA1A -Credential $creds
Disconnect-PSSession
Connect-PSSession
Remove-PSSession

Enter-PSSession -Session $sessions[0]
Enter-PSSession -Session ($sessions |where { $_.computername -eq ‘localhost’ })
Enter-PSSession -Session (Get-PSSession -ComputerName 'localhost’)

$s_server1,$s_server2 = new-pssession -computer localhost, DESKTOP-52INA1A -Credential $creds

Invoke-Command -Command { Get-WmiObject -Class win32_process } -Session $sessions | 
    Format-Table -Property PSComputerName, processname, ProcessID, ParentProcessID

invoke-command -command { get-wmiobject -class win32_process } -session $sessions | 
    Select-Object ProcessName, PSComputerName, Path | Group-Object ProcessName | 
    Sort-Object Count -Descending | Format-Table -AutoSize


#Trusted Hosts
Get-Item wsman:\localhost\Client\TrustedHosts
Set-Item wsman:localhost\client\trustedhosts -Value *

#########################################################################################

#reset WinRM
Disable-PSRemoting
winrm enumerate winrm/config/listener
winrm delete winrm/config/listener?address=*+transport=HTTP
Stop-Service winrm
Set-Service -Name winrm -StartupType Disabled
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System `
    -Name LocalAccountTokenFilterPolicy -Value 0 -Type DWord
Disable-NetFirewallRule -DisplayName 'Windows Remote Management (HTTP-In)' 
Get-NetFirewallRule -DisplayName 'Windows Remote Management (HTTP-In)'