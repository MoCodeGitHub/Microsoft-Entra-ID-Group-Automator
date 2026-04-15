# ==========================================================
# Entra ID Group Automator (Simulation)
# Script: create-groups.ps1
# Purpose: Simulate bulk group creation from CSV
# ==========================================================

# Define paths
$csvPath = "$PSScriptRoot\..\data\groups.csv"
$logPath = "$PSScriptRoot\..\logs\results.txt"

# Check if CSV exists
if (!(Test-Path $csvPath)) {

    Write-Host "❌ ERROR: groups.csv not found." -ForegroundColor Red
    exit

}

# Import group data
$groups = Import-Csv $csvPath

# Process groups
foreach ($group in $groups) {

    Write-Host "Processing group:" $group.DisplayName

    try {

        # Create timestamp
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        # Simulated group creation message
        $message = "$timestamp - Created group: $($group.DisplayName)"

        # Display success message
        Write-Host "✅ Created group:" $group.DisplayName -ForegroundColor Green

        # Log result
        Add-Content -Path $logPath -Value $message

    }

    catch {

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        $errorMsg = "$timestamp - Failed group: $($group.DisplayName)"

        Write-Host "❌ Failed group:" $group.DisplayName -ForegroundColor Red

        Add-Content -Path $logPath -Value $errorMsg

    }

}

Write-Host "`n🎉 Group processing complete." -ForegroundColor Cyan