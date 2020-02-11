Get-Process | ConvertTo-HTML | Out-File processes.html
.\processes.html

get-process | get-member | where {$_.membertype -eq 'Property'} | 
    group MemberType | sort count –Descending

(Get-service –name bits).start()
(Get-service –name bits).stop()

Get-Service * | where {($_.starttype -like "man*") -and ($_.status -eq "Stopped")} | 
    Select-Object -Property Name, Status, StartType

get-service * | where {$_.starttype -like "man*"} | select Name, Status, StartType | group status | sort count –Descending

Get-Process | Sort VM -descending | gm
Get-Process | Sort VM -descending | Select Name,ID,VM | gm
