# Define file and folder paths
$yapBotFolderPath = "$env:USERPROFILE\Documents\Applications\Yap Bot"
$desktopShortcutPath = "$env:USERPROFILE\Desktop\Twitch Yap Bot.lnk"
$desktopShortcutPath2 = "$env:USERPROFILE\Desktop\Yap Editor.lnk"
$desktopShortcutPath3 = "$env:USERPROFILE\Desktop\Yap Updater.lnk"
$startMenuShortcutPath = "$env:USERPROFILE\Documents\Pinned Folders\Start Menu Programs\Twitch Yap Bot.lnk"
$startMenuShortcutPath2 = "$env:USERPROFILE\Documents\Pinned Folders\Start Menu Programs\Yap Editor.lnk"
$startMenuShortcutPath3 = "$env:USERPROFILE\Documents\Pinned Folders\Start Menu Programs\Yap Updater.lnk"

# Check and remove Yap Bot folder if it exists
if (Test-Path -Path $yapBotFolderPath) {
    Remove-Item -Path $yapBotFolderPath -Recurse -Force -Confirm:$false
} else {
}

# Check and remove desktop shortcut if it exists
if (Test-Path -Path $desktopShortcutPath) {
    Remove-Item -Path $desktopShortcutPath -Force -Confirm:$false
} else {
}

# Check and remove desktop shortcut if it exists
if (Test-Path -Path $desktopShortcutPath2) {
    Remove-Item -Path $desktopShortcutPath2 -Force -Confirm:$false
} else {
}

# Check and remove desktop shortcut if it exists
if (Test-Path -Path $desktopShortcutPath3) {
    Remove-Item -Path $desktopShortcutPath3 -Force -Confirm:$false
} else {
}

# Check and remove start menu shortcut if it exists
if (Test-Path -Path $startMenuShortcutPath) {
    Remove-Item -Path $startMenuShortcutPath -Force -Confirm:$false
} else {
}

# Check and remove start menu shortcut if it exists
if (Test-Path -Path $startMenuShortcutPath2) {
    Remove-Item -Path $startMenuShortcutPath2 -Force -Confirm:$false
} else {
}

# Check and remove start menu shortcut if it exists
if (Test-Path -Path $startMenuShortcutPath3) {
    Remove-Item -Path $startMenuShortcutPath3 -Force -Confirm:$false
} else {
}

Write-Host "Yap Bot has been uninstalled."