# Verify users and groups

Get-ADUser -filter 'name -like "JEA*"' | Select-Object name
Get-ADGroupMember -Identity "Domain Admins" | Select-Object name
Get-ADGroupMember "Domain Users" | Select-Object name

#test remote sessions
Enter-PSSession -ComputerName JEA-DEMOSVR -Credential (Get-Credential)

get-command *

Exit-PSSession


#build the JEA Module Folder
New-Item -ItemType directory -Path 'C:\JEAConfigs\Modules\' -Name BSidesJEA
New-Item -ItemType directory -Path 'C:\JEAConfigs\Modules\BsidesJEA' -Name RoleCapabilities #Must Have

#create a role capability file
New-PSRoleCapabilityFile -Path 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Developer.psrc'
ise 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Developer.psrc'
ise 'C:\JEAConfigs\JEA-DemoFiles\RoleCapabilities\Developer.psrc'

New-PSRoleCapabilityFile -Path 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Contractors.psrc'
ise 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Contractors.psrc'
ise 'C:\JEAConfigs\JEA-DemoFiles\RoleCapabilities\Developer.psrc'

#create a session config file
New-PSSessionConfigurationFile -Path 'C:\JEAConfigs\Modules\BsidesJEA\RestrictedSession.pssc' `
                               -SessionType RestrictedRemoteServer `
                               -TranscriptDirectory "C:\Program Files\WindowsPowerShell\Modules\BSidesJEA\" `
                               -RunAsVirtualAccount `
                               -RoleDefinitions @{ 'JeaDemo\JEA_Developers' = @{ RoleCapabilities = 'Developer' } ;
                                              'JeaDemo\JEA_Contractors' = @{ RoleCapabilities = 'Contractors'}} 
 
 ise 'C:\JEAConfigs\Modules\BsidesJEA\RestrictedSession.pssc'                                          

# Copy pre-made files to server
Copy-Item -Path 'C:\JEAConfigs\JEA-DemoFiles\RoleCapabilities\Developer.psrc' -Destination 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Developer.psrc' -Force
Copy-Item -Path 'C:\JEAConfigs\JEA-DemoFiles\RoleCapabilities\Developer.psrc' -Destination 'C:\JEAConfigs\Modules\BsidesJEA\RoleCapabilities\Contractors.psrc' -Force

$DemoSVRSession = New-PSSession -ComputerName Jea-DemoSVR -Credential 'jeademo\jea.admin'
Copy-Item -Path 'C:\JEAConfigs\Modules\BSidesJEA' -Destination 'c:\Program Files\WindowsPowerShell\Modules\BSidesJEA' -ToSession $DemoSVRSession -Recurse

#Register the EndPoint - 
Enter-PSSession -ComputerName JEA-DemoSVR

Invoke-Command -ComputerName JEA-DemoSVR -ScriptBlock { Unregister-PSSessionConfiguration -Name BSidesDemo }
Invoke-Command -ComputerName JEA-DemoSVR -ScriptBlock { Register-PSSessionConfiguration -Name BSidesDemo -Path 'C:\Program Files\WindowsPowerShell\Modules\BSidesJEA\RestrictedSession.pssc' }

# Restart WinRM Service on remote computer
Exit-PSSession 

Invoke-Command -ComputerName JEA-DemoSVR -ScriptBlock { Restart-Service -Name WinRM }
Invoke-Command -ComputerName JEA-DemoSVR -ScriptBlock { Get-PSSessionConfiguration | Select-Object name,permission }

Enter-PSSession -ComputerName JEA-DEMOSVR -Credential 'jeademo\jea.user' -ConfigurationName BSidesDemo

# Enter Remote Sessions with unprivledge users

Enter-PSSession -ComputerName JEA-DEMOSVR -Credential 'jeademo\jea.dev'
Enter-PSSession -ComputerName JEA-DEMOSVR -Credential 'jeademo\jea.dev' -ConfigurationName BSidesDemo

Get-Command
Restart-Service -Name BITS
Restart-Service -Name WinRM
whoami
Exit-PSSession 

# Make sure I am loged into the Jea-DEMOSVR
Enter-PSSession -ComputerName JEA-DEMOSVR -Credential 'jeademo\jea.contractor' -ConfigurationName BSidesDemo 
Get-Command
Restart-Service -Name BITS
whoami
restart-computer
Restart-Computer -force

Enter-PSSession -ComputerName JEA-DEMOSVR -Credential 'jeademo\jea.user' -ConfigurationName BSidesDemo



