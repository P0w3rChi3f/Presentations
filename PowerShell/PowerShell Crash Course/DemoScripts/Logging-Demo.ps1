#Module Logging
Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational | 
    where {$_.Id -eq "4103"} | Format-List


#Test
test-path HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging 

#Enable Script Block Logging
New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging –Force
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging `
    -Name "EnableScriptBlockLogging" -PropertyType "DWORD" -Value 1

#demo
Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational | 
    where {$_.Id -eq "4104"} | 
    select -first 5 | format-list

#Language Modes
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2
$ExecutionContext.SessionState.LanguageMode



