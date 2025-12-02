echo

echo "Setting custom zsh theme"
cp files/anne.zsh-theme ~/.oh-my-zsh/themes
sed -i.bak 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="anne"/' ~/.zshrc

echo "Setting custom git plugin"
cp -R files/git-prompt-anne/* ~/.oh-my-zsh/plugins/git-prompt-anne
sed -i.bak 's/^plugins=(git)$/plugins=(git-prompt-anne)/' ~/.zshrc
