# Disable Copilot in Windows
$PolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows"

New-Item -Path "$PolicyPath\WindowsCopilot" -Force | Out-Null
Set-ItemProperty -Path "$PolicyPath\WindowsCopilot" -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord

# Disable Copilot in Taskbar
$ExplorerPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
New-Item -Path $ExplorerPath -Force | Out-Null
Set-ItemProperty -Path $ExplorerPath -Name "HideTaskViewButton" -Value 1 -Type DWord

# Current User
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCopilotButton" -Value 0 -Type DWord

Write-Host "Windows Copilot has been disabled." -ForegroundColor Red
Write-Host "Please Restart your Computer to apply the changes." -ForegroundColor Green