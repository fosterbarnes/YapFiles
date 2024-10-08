# Set the title of the PowerShell window
$Host.UI.RawUI.WindowTitle = "Yap Bot Updater"

# Download TwitchMarkovChain-2.4, unzip and delete zip
Invoke-WebRequest -Uri "https://github.com/fosterbarnes/YapFiles/archive/refs/heads/main.zip" -OutFile "$env:USERPROFILE\Downloads\YapFiles.zip"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$env:USERPROFILE\Downloads\YapFiles.zip", "$env:USERPROFILE\Downloads\YapFiles")
Remove-Item -Path "$env:USERPROFILE\Downloads\YapFiles.zip"

Write-Host "Updating Yap Bot..."

#Copy and replace YapBotInstaller, YapBotUninstaller, YapBotUpdater & YapEditor
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\Twitch Yap Bot.ps1" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\yap icon.ico" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\yap icon purple.ico" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\yap icon blue.ico" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\YapBotUninstaller.ps1" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\YapEditor.ps1" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force
Copy-Item -Path "$env:USERPROFILE\Downloads\YapFiles\YapFiles-main\YapBotUpdater.ps1" -Destination "$env:USERPROFILE\Documents\Applications\Yap Bot" -Recurse -Force

Write-Host "`n-----------------------------------------------------------------"
Write-Host "Twitch Yap Bot.ps1 saved to $env:USERPROFILE\Documents\Applications\Yap Bot\Twitch Yap Bot.ps1"
Write-Host "yap icon.ico saved to $env:USERPROFILE\Documents\Applications\Yap Bot\yap icon.ico"
Write-Host "yap icon purple.ico saved to $env:USERPROFILE\Documents\Applications\Yap Bot\yap icon purple.ico"
Write-Host "yap icon blue.ico saved to $env:USERPROFILE\Documents\Applications\Yap Bot\yap icon blue.ico"
Write-Host "YapBotUninstaller.ps1 saved to $env:USERPROFILE\Documents\Applications\Yap Bot\YapBotUninstaller.ps1"
Write-Host "YapEditor.ps1 saved to $env:USERPROFILE\Documents\Applications\Yap Bot\YapEditor.ps1"
Write-Host "YapUpdater.ps1 saved to $env:USERPROFILE\Documents\Applications\Yap Bot\YapBotUpdater.ps1"
Write-Host "-----------------------------------------------------------------"

#Cleanup
Remove-Item -Path "$env:USERPROFILE\Downloads\YapFiles" -Recurse -Force

Write-Host "`nPress any key to close Yap Bot Updater..."
[void][System.Console]::ReadKey($true)
exit