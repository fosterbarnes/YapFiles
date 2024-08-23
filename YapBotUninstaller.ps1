# Define file and folder paths
$yapBotFolderPath = "$env:USERPROFILE\Documents\Applications\Yap Bot"
$desktopShortcutPath = "$env:USERPROFILE\Desktop\Twitch Yap Bot.lnk"
$startMenuShortcutPath = "$env:USERPROFILE\Documents\Pinned Folders\Start Menu Programs\Twitch Yap Bot.lnk"

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

# Check and remove start menu shortcut if it exists
if (Test-Path -Path $startMenuShortcutPath) {
    Remove-Item -Path $startMenuShortcutPath -Force -Confirm:$false
} else {
}
