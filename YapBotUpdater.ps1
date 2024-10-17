# Set the title of the PowerShell window
$Host.UI.RawUI.WindowTitle = "Yap Bot Updater"

# Download TwitchMarkovChain & YapFiles, unzip and delete zip
#Invoke-WebRequest -Uri "https://github.com/fosterbarnes/YapFiles/archive/refs/heads/main.zip" -OutFile "$env:USERPROFILE\Downloads\YapFiles.zip"
#Add-Type -AssemblyName System.IO.Compression.FileSystem
#[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:USERPROFILE\Downloads\YapFiles.zip", "$env:USERPROFILE\Downloads\YapFiles")
#Remove-Item -Path "$env:USERPROFILE\Downloads\YapFiles.zip"
# Download TwitchMarkovChain, Yap Files, unzip and delete zip
Invoke-WebRequest -Uri "https://github.com/fosterbarnes/Twitch-Yap-Bot-Installer/archive/refs/heads/main.zip" -OutFile "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer.zip"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer.zip", "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer-1")
Remove-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer.zip"
Copy-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer-1\Twitch-Yap-Bot-Installer-main" -Destination "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer" -Recurse
Remove-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer-1\" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer\YapFiles" -Destination "$env:USERPROFILE\Downloads\YapFiles" -Recurse
Copy-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer\TwitchMarkovChain" -Destination "$env:USERPROFILE\Downloads\YapFiles\TwitchMarkovChain" -Recurse
Remove-Item -Path "$env:USERPROFILE\Downloads\Twitch-Yap-Bot-Installer" -Recurse -Force

Write-Host "Updating Yap Bot..."

#Copy and replace YapBotInstaller, YapBotUninstaller, YapBotUpdater & YapEditor
$filesToCopy = @(
    "Twitch Yap Bot.ps1",
    "yap icon.ico",
    "yap icon purple.ico",
    "yap icon blue.ico",
    "YapBotUninstaller.ps1",
    "YapEditor.ps1",
    "YapBotUpdater.ps1"
)

foreach ($file in $filesToCopy) {
    $sourcePath = "$env:USERPROFILE\Downloads\YapFiles\$file"
    $destinationPath = "$env:USERPROFILE\Documents\Applications\Yap Bot\$file"
    
    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
    
    # Verify if the file was copied successfully
    if (Test-Path -Path $destinationPath) {
        Write-Host "$file saved to $destinationPath"
    } else {
        Write-Host "Error: $file could not be copied to $destinationPath"
    }
}

$filesToCopy2 = @(
    "MarkovChainBot.py"
)

foreach ($file2 in $filesToCopy2) {
    $sourcePath = "$env:USERPROFILE\Downloads\YapFiles\TwitchMarkovChain\$file2"
    $destinationPath = "$env:USERPROFILE\Documents\Applications\Yap Bot\TwitchMarkovChain\$file2"
    
    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
    
    # Verify if the file was copied successfully
    if (Test-Path -Path $destinationPath) {
        Write-Host "$file2 saved to $destinationPath"
    } else {
        Write-Host "Error: $file2 could not be copied to $destinationPath"
    }
}

#Cleanup
Remove-Item -Path "$env:USERPROFILE\Downloads\YapFiles" -Recurse -Force

Write-Host "`nPress any key to close Yap Bot Updater..."
[void][System.Console]::ReadKey($true)
exit
