#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

# echo "Caching password..."
# sudo -K
# sudo true;
# clear

MY_DIR="$(dirname "$0")"

source ${MY_DIR}/scripts/homebrew.sh # homebrew needs to be set up first

# applications
source ${MY_DIR}/scripts/applications.sh

# configurations and preferences
source ${MY_DIR}/scripts/unix.sh
source ${MY_DIR}/scripts/config-custom-zsh.sh # comment this out if you want to configure your own zsh
source ${MY_DIR}/scripts/git-aliases.sh
source ${MY_DIR}/scripts/config-mac.sh

# languages and tools
source ${MY_DIR}/scripts/node.sh
source ${MY_DIR}/scripts/ruby.sh
source ${MY_DIR}/scripts/python.sh
source ${MY_DIR}/scripts/postgres.sh
source ${MY_DIR}/scripts/docker.sh


echo
echo "-----------------------------------------"
echo "Done!"
echo "-----------------------------------------"


echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the installed tools."
echo "Rebooting is only necessary for keyboard repeat settings to work."

echo
