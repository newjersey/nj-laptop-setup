echo

if [ -z "$ZSH" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh is already installed!"
fi

echo "Setting custom zsh theme"
cp files/anne.zsh-theme ~/.oh-my-zsh/themes
sed -i.bak 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="anne"/' ~/.zshrc

echo "Setting custom git plugin"
cp -R files/git-prompt-anne/* ~/.oh-my-zsh/plugins/git-prompt-anne
sed -i.bak 's/^plugins=(git)$/plugins=(git-prompt-anne)/' ~/.zshrc
