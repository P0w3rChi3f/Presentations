


function build-lab {

    [CmdletBinding()]
    
    param(
        [Parameter(Mandatory=$true)]
        [string] $NewName)

$currentIP = Get-NetIPAddress | Where-Object {$_.InterfaceAlias -like "Ethernet0"} | Where-Object {$_.AddressFamily -like "IPv4"}

Set-NetIPAddress -IPAddress $currentIP.IPAddress -PrefixLength $currentIP.PrefixLength

Get-DnsClientServerAddress | Where-Object {$_.AddressFamily -like "IPv4"} #| Where-Object{$_.InterfaceAlias -like "Ethernet0"}
Rename-Computer -NewName $NewName
Restart-Computer


# Install Domain

Install-WindowsFeature -Name Install-WindowsFeature -Name AD-Domain-Services
install-addsforest -Domainname 

Add-Computer -DomainName jeademo.local


#create users

$DomainUsers = "Jea Admin", "Jea User", "Jea Dev", "Jea Contractor"

foreach ($user in $DomainUsers) {
    New-ADUser -SamAccountName ($user).SamAccountName -Name ($user) -AccountPassword (ConvertTo-SecureString -AsPlainText "Password12#$" -Force) -Enabled $true -path "OU=Users,OU=DemoLAB,DC=JEADemo,DC=local"



    }# Close foreach loop



}# Close function