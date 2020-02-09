get-service | where-object -Filter {$_.status -eq 'running’ }

Get-Service | Where-Object Status -eq 'Running’
    
Get-Service | Where-Object {$_.status -eq 'running' -AND $_.StartType -eq 'Manual’}

Get-Process | Where-Object -Filter { $_.Name -notlike 'powershell*' } | 
    Sort VM -descending | Select -first 10 -Property ProcessName, VM, ID | 
    Measure-Object -property VM -sum
