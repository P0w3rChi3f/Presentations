#If/Elses
#
 $a = 1
if (($a -gt 2) -and ($a -le 10))
    {Write-Host "The Value `$a is greater than 2 less than 10."}
elseif  ($a -le 2)
    {Write-Host "The value `$a is less than 2."}
else {Write-Host "The value `$a is greater than 10."} 

#>

######################################################################################
code “C:\Scripts\PowerShell\UserAccounts\Uploaded to GitHub\New-ADUser_Prompted.ps1”
######################################################################################

#Switch
#
[string]$a = 2
switch ($a)
         {
            1 {"It is one."}
            2 {"It is two."; Break}
            3 {"It is three."}
            4 {"It is four."}
            3 {"Three again."}
         }
#>

######################################################################################
code C:\Scripts\PowerShell\Vmware\ViewVM-SetState.ps1
######################################################################################

#ForEach
#
$letters = "a","b","c","d“
foreach ($letter in $letters) {Write-Host $letter}
#>

######################################################################################
 code “C:\Scripts\PowerShell\UserAccounts\Uploaded to GitHub\Get-InactiveUsers.ps1”
######################################################################################

#For

for($i=1; $i -le 100; $i++){Write-Host $i}

######################################################################################

#Do-Until

######################################################################################
code C:\Scripts\PowerShell\UserAccounts\lockaccounts.ps1
######################################################################################

#Do-While

######################################################################################
code C:\Scripts\PowerShell\_InProgress\Generate-Files.ps1
######################################################################################

#While

######################################################################################
code C:\Scripts\PowerShell\UserAccounts\Invoke-RandomUser.ps1
######################################################################################

do
    {
        if ($x[$a] -lt 0) { continue }
        Write-Host $x[$a]
    }
        while (++$a -lt 10)