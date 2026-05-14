$WindowsAIPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"

New-Item -Path $WindowsAIPath -Force | Out-Null

# Disable Recall completely
Set-ItemProperty -Path $WindowsAIPath -Name "AllowRecallEnablement" -Value 0 -Type DWord
Set-ItemProperty -Path $WindowsAIPath -Name "DisableAIDataAnalysis" -Value 1 -Type DWord

# Remove Recall bits entirely (requires restart)
Disable-WindowsOptionalFeature -Online -FeatureName "Recall" -Remove -NoRestart

Write-Host "Windows Recall has been disabled and removed." -ForegroundColor Red
Write-Host "Please Restart your Computer at this time to apply the changes." -ForegroundColor Green