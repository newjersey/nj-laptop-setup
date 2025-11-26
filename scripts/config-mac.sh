echo
echo 'Customizing MacOS configuration'

# hide the dock
defaults write com.apple.dock autohide -bool true
killall Dock

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

set +e # allow dock config to fail if user has already customized

# dock: remove standard icons, add common apps
brew install dockutil
dockutil --remove all
dockutil --add /Applications/Bitwarden.app --no-restart
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/Firefox.app --no-restart
dockutil --add /Applications/Safari.app --no-restart
dockutil --add /Applications/iTerm.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /Applications/Visual\ Studio\ Code.app/

set -e