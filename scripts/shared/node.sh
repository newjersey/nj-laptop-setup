echo
echo "Installing nvm and Node"

export NVM_DIR="$HOME/.nvm"

if [ -d "${NVM_DIR}/.git" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm install node
    current=$(nvm current)
    already_installed+=("nvm: Node $current")
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install node
    current=$(nvm current)
    newly_installed+=("nvm: Node $current")
fi
