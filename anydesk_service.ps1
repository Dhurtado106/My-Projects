# PowerShell script to start or stop AnyDesk service on Linux
# Usage: .\anydesk_service.ps1 -Action start
#        .\anydesk_service.ps1 -Action stop

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("start", "stop")]
    [string]$Action
)

$serviceName = "anydesk"

try {
    if ($Action -eq "start") {
        Write-Host "Starting AnyDesk service..."
        sudo systemctl start $serviceName
        Write-Host "AnyDesk service started successfully."
    } elseif ($Action -eq "stop") {
        Write-Host "Stopping AnyDesk service..."
        sudo systemctl stop $serviceName
        Write-Host "AnyDesk service stopped successfully."
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}