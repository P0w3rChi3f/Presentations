Get-Service | ConvertTo-HTML | Out-File services.html ; .\services.html

notepad.exe
Get-Process -name Notepad | Stop-Process

get-process | Out-GridView
export-csv c:\demo\processes.csv -NoTypeInformation -force
.\processes.csv

###############################################################################################
 
$localName = 'DESKTOP-52INA1A', 'localhost'
$localName | Out-File .\servers.txt -Force
 
.\servers.txt

Get-help get-service –full

Get-content .\servers.txt | Get-service (fail)
Get-process -name note* | stop-process #(win)


