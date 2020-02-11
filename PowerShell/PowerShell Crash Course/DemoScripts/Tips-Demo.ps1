
Get-WinEvent -Path "C:\Users\honey\Documents\PowerShellCTF\Win7-security.evtx" | 
    where { $_.id -eq 4624 } | select -ExpandProperty message | 
    Select-String -Pattern "Logon\D+:\s+3" | measure


get-date | gm
$90daysago = $today.adddays(-90)