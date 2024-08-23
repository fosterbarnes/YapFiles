if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { 
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs -WindowStyle Hidden 
    exit 
    } 
# Define the batch script content
$batchContent = @"
@echo off
title Twitch Yap Bot
cd "%USERPROFILE%\Documents\Applications\Yap Bot\TwitchMarkovChain-2.4"
"%LOCALAPPDATA%\Programs\Python\Python312\python.exe" "%USERPROFILE%\Documents\Applications\Yap Bot\TwitchMarkovChain-2.4\MarkovChainBot.py"
exit
"@

# Get the path to the temporary directory
$tempDir = [System.IO.Path]::GetTempPath()

# Define the temporary batch file path
$tempBatchFilePath = Join-Path -Path $tempDir -ChildPath "YapBotTemp.bat"

# Write the batch content to the temporary file
Set-Content -Path $tempBatchFilePath -Value $batchContent

# Run the temporary batch file
Start-Process cmd.exe -ArgumentList "/c `"$tempBatchFilePath`""

# Function to check if a process is running
function Wait-ForProcesses {
    param (
        [string[]]$processNames
    )

    do {
        $processFound = $false
        foreach ($processName in $processNames) {
            if (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
                $processFound = $true
                break
            }
        }
        if (-not $processFound) {
            Write-Host "Waiting for OBS or Streamlabs OBS to start..."
            Start-Sleep -Seconds 2
        }
    } until ($processFound)
}

# Wait for either obs64.exe or Streamlabs OBS.exe to start
Wait-ForProcesses -processNames @("obs64", "Streamlabs OBS")

# Wait for the OBS process to exit
Wait-Process -Name obs64
Wait-Process -Name 'Streamlabs OBS'

# Stop the processes
Stop-Process -Name 'Twitch Yap Bot' -Force
Stop-Process -Name python -Force

# Remove the temporary batch file
Remove-Item -Path $tempBatchFilePath -Force
