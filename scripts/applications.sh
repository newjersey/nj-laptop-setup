# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# macos window management
brew install --cask rectangle
brew install --cask postman

# Terminal
brew install --cask iterm2

# Browsers
brew install --cask firefox

# Editors
brew install --cask visual-studio-code
brew install --cask macdown

set -e
