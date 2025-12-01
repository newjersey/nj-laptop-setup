#!/usr/bin/env bash

# Fail immediately if any errors occur
set -e

MY_DIR="$(dirname "$0")"

# homebrew needs to be set up first
source ${MY_DIR}/scripts/shared/homebrew.sh

# applications & unix
source ${MY_DIR}/scripts/shared/applications.sh
source ${MY_DIR}/scripts/shared/unix.sh

# configurations and preferences
source ${MY_DIR}/scripts/customizations/oh-my-zsh.sh
source ${MY_DIR}/scripts/customizations/git-aliases.sh
source ${MY_DIR}/scripts/customizations/mac.sh

# languages and tools
source ${MY_DIR}/scripts/shared/node.sh
source ${MY_DIR}/scripts/shared/ruby.sh
source ${MY_DIR}/scripts/shared/python.sh
source ${MY_DIR}/scripts/shared/postgres.sh
source ${MY_DIR}/scripts/shared/docker.sh


echo
echo "-----------------------------------------"
echo "Done!"
echo "-----------------------------------------"


echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the installed tools."
echo "Rebooting is only necessary for keyboard repeat settings to work."

echo
