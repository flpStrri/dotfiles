#!/usr/bin/env zsh
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Menu bar
# --------
# Menu bar: show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES

# Set clock format to "Thu 24 Sep 18:33"
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Finder
# --------
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 32" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 32" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 32" ~/Library/Preferences/com.apple.finder.plist

# Update default application handlers
set -x
duti -s com.microsoft.VSCode net.daringfireball.markdown all
duti -s com.microsoft.VSCode public.json all
duti -s com.jetbrains.pycharm public.python-script all
duti -s com.microsoft.VSCode public.yaml all
set +x

# TODO: Add ~/ to Finder sidebar

# Make new Finder show ~/
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Keyboard & Input
# --------
# Disable smart quotes and dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Trackpad, mouse, Bluetooth accessories
# --------

# TODO: enable tap to click for this user and for the login screen

# TODO: three fingers drag

# Dock
# --------
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Update dock icons
chmod +x ./etc/set-icon
./etc/set-icon assets/Slack.icns /Applications/Slack.app
./etc/set-icon assets/Pycharm.icns /Applications/Pycharm.app
./etc/set-icon assets/Docker.icns /Applications/Docker.app
./etc/set-icon assets/AppCleaner.icns /Applications/AppCleaner.app
./etc/set-icon assets/VSCode.icns /Applications/Visual\ Studio\ Code.app
./etc/set-icon assets/Firefox.icns /Applications/Firefox.app

# Add apps to dock
set -x
dockutil --remove all --no-restart          
dockutil --add /System/Applications/Mail.app --no-restart
dockutil --add /System/Applications/Calendar.app --no-restart
dockutil --add /System/Applications/Reminders.app --no-restart
dockutil --add /Applications/Safari.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /Applications/PyCharm.app --no-restart
dockutil --add /System/Applications/Utilities/Terminal.app --no-restart
dockutil --add /System/Applications/Music.app --no-restart
dockutil --add ~/Downloads --display stack
set +x

# Disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Mail
# --------
# TODO: Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app

# TODO: Disable inline attachments (just show the icons)

# Calendar
# --------
# TODO: Show 5 days per week

# TODO: Show 6 hours a time

# Software Updates
# --------
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Terminal
# --------
# Define Gruvbox as defaut theme
if ! defaults read com.apple.Terminal "Window Settings" | grep -Fw gruvbox-dark >/dev/null; then
    open -a Terminal assets/Gruvbox-dark.terminal
fi
defaults write com.apple.terminal "Default Window Settings" -string "Gruvbox-dark"
defaults write com.apple.terminal "Startup Window Settings" -string "Gruvbox-dark"

# Kill affected applications
# --------
for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
  killall "${app}" &> /dev/null
done