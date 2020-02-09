#Format-Table
    #-autosize (adjusts to column width)
       Get-Process | select -last 15 | Format-Table

    #ii) -property (instead of piping to select)
       Get-Process | select -last 15 | Format-Table -Property MachineName, ID, ProcessName, responding

    #iii) –groupBy
        Get-Service | Sort-Object Status | Format-Table -groupBy Status

    #iv) –wrap
       Get-Service | Format-Table Name,Status,DisplayName -autoSize –wrap

#Format-Wide (wide list)
        Get-Service | Format-Table

#Format-list
    #-property
        Get-Process | Format-list -Property Name,ID

    #-groupBy
        Get-Process | Format-list -Property Name,ID -GroupBy name

    #-others
#out-*
get-command out-*
Get-Service | Group-Object -Property Status | Sort-Object -Property Count -Descending | 
    ConvertTo-Json | Out-File .\Services.json

#Custom Columns
    Get-Process | select -first 5 | Format-Table -Property name,vm
    Get-Process | select -first 5 | 
        Format-Table Name,  @{name='VM(MB)';expression={$_.VM / 1MB -as [int]}} –autosize

Code “C:\Scripts\PowerShell\Server\Uploaded to GitHub\Get-ServerRebootStatus.ps1”

$userData = Import-Csv 'C:\Users\honey\Google Drive\Presentations\PowerShell\PowerShell Crash Course\UserData.csv'

$userData | select -First 5 | 
    Format-Table -property ID, @{name='FName';expression={$_.first_name}}, 
    @{name='LName';expression={$_.last_name}}, email, gender

$userData | select ID, @{name='FName';expression={$_.first_name}}, 
    @{name='LName';expression={$_.last_name}}, email, gender | 
    export-csv 'C:\demo\User.csv' -NoTypeInformation

get-command out-*

Write-Host "Colorful Text!" -ForegroundColor black -BackgroundColor Green


