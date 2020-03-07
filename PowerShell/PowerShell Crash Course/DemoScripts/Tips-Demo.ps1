
Get-WinEvent -Path "C:\Users\honey\Documents\PowerShellCTF\Win7-security.evtx" | 
Where-Object { $_.id -eq 4624 } | Select-Object -ExpandProperty message | 
    Select-Object-String -Pattern "Logon\D+:\s+3" | Measure-Object


get-date | Get-Member
$90daysago = $today.adddays(-90)

$90daysago