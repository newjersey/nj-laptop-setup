#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

MY_DIR="$(dirname "$0")"

source ${MY_DIR}/scripts/helpers.sh

# track what is installed
already_installed=()
newly_installed=()
failed=()

# homebrew needs to be set up first
source ${MY_DIR}/scripts/shared/homebrew.sh

# applications & tools
source ${MY_DIR}/scripts/shared/applications.sh

# languages and tools
source ${MY_DIR}/scripts/shared/node.sh
source ${MY_DIR}/scripts/shared/ruby.sh
source ${MY_DIR}/scripts/shared/python.sh
source ${MY_DIR}/scripts/shared/postgres.sh
source ${MY_DIR}/scripts/shared/docker.sh

# configurations and preferences

echo
echo "OPTIONAL CUSTOMIZATIONS"
echo "-----------------------"

echo
echo "Do you want to install oh-my-zsh?"
echo "This is recommended, it makes it easier to customize your zsh terminal."
prompt_user ${MY_DIR}/scripts/customizations/oh-my-zsh.sh

echo
echo "Do you want to install anne's oh-my-zsh custom theme?"
echo "This is optional, it will change your theme colors and terminal prompt style. It will overwrite any existing custom zshrc theme and plugins"
prompt_user ${MY_DIR}/scripts/customizations/oh-my-zsh-customizations.sh

echo
echo "Do you want to add custom git aliases?"
echo "This will allow you to type 'git st' as a status shorthand, for example"
prompt_user ${MY_DIR}/scripts/customizations/git-aliases.sh

echo
echo "Do you want to configure custom mac preferences?"
echo "This will auto-hide your dock, fix the dock pins to sensible apps, & set key repeat to be faster"
prompt_user ${MY_DIR}/scripts/customizations/mac.sh

echo

echo -e "\nSummary of all installations:"
echo "=================================="
echo
echo "(SKIPPED) Already installed packages:"
echo "-------------------------------------"
for package in "${already_installed[@]}"; do
    echo "⏭️ $package"
done

echo

echo "Installed or updated packages:"
echo "------------------------------"
for package in "${newly_installed[@]}"; do
    echo "✅ $package"
done

echo

echo "Failed to install packages:"
echo "--------------------------"
for package in "${failed[@]}"; do
    echo "⛔ $package"
done

echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the installed tools."
echo "Rebooting is only necessary for keyboard repeat settings to work."

echo
