# Define Variables
$sourcePath = "C:\SourceFolder"
$destinationPath = "C:\DestinationFolder"
# Check if the source directory exists
if (Test-Path -Path $sourcePath) {
    # Create the destination directory if it doesn't exist
    if (-not (Test-Path -Path $destinationPath)) {
        New-Item -ItemType Directory -Path $destinationPath
    }
    # Copy files from source to destination
    Get-ChildItem -Path $sourcePath -File | ForEach-Object {
        $destinationFile = Join-Path -Path $destinationPath -ChildPath $_.Name
        Copy-Item -Path $_.FullName -Destination $destinationFile -Force
        Write-Host "Copied: $($_.FullName) to $destinationFile" -ForegroundColor Green
    }
    Write-Host "All files have been copied successfully!" -ForegroundColor Cyan
} else {    Write-Host "Source directory does not exist: $sourcePath" -ForegroundColor Red
}

$greeting = "Hello"
$name = "User"
Write-Host "$greeting, $name! Welcome to PowerShell scripting. This script demonstrates"