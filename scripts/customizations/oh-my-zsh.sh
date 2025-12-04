echo

if [ -z "$ZSH" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  newly_installed+=("oh-my-zsh")
else
  already_installed+=("oh-my-zsh")
  echo "oh-my-zsh is already installed!"
fi
