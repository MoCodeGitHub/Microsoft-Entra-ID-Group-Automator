# ==========================================================
# Entra ID Group Automator (Simulation)
# Script: add-users-to-groups.ps1
# Purpose: Simulate assigning users to groups
# ==========================================================

# Define paths
$csvPath = "$PSScriptRoot\..\data\memberships.csv"
$logPath = "$PSScriptRoot\..\logs\membership-results.txt"

# Check if CSV exists
if (!(Test-Path $csvPath)) {

    Write-Host "❌ ERROR: memberships.csv not found." -ForegroundColor Red
    exit

}

# Import membership data
$memberships = Import-Csv $csvPath

# Process assignments
foreach ($entry in $memberships) {

    Write-Host "Assigning user:" $entry.UserName "to group:" $entry.GroupName

    try {

        # Create timestamp
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        # Simulated assignment message
        $message = "$timestamp - Assigned $($entry.UserName) to $($entry.GroupName)"

        # Display success message
        Write-Host "✅ Assigned $($entry.UserName) to $($entry.GroupName)" -ForegroundColor Green

        # Log result
        Add-Content -Path $logPath -Value $message

    }

    catch {

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        $errorMsg = "$timestamp - Failed assignment: $($entry.UserName)"

        Write-Host "❌ Failed assignment:" $entry.UserName -ForegroundColor Red

        Add-Content -Path $logPath -Value $errorMsg

    }

}

Write-Host "`n🎉 User assignment complete." -ForegroundColor Cyan