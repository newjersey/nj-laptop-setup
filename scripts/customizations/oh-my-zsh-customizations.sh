echo

echo "Setting custom zsh theme"
cp files/anne.zsh-theme ~/.oh-my-zsh/themes
sed -i '' 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="anne"/' ~/.zshrc

echo "Setting custom git plugin"
cp -R files/git-prompt-anne/* ~/.oh-my-zsh/plugins/git-prompt-anne

if grep -q '^plugins=' ~/.zshrc; then
  existing_plugins=$(grep '^plugins=(' ~/.zshrc | sed 's/^plugins=(\(.*\))$/\1/' | tr -d '"' | tr -d "'")
  all_plugins="$existing_plugins git-prompt-anne"
  deduped_plugins=$(echo "$all_plugins" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')
  sed -i '' "s/^plugins=(.*)$/plugins=($deduped_plugins)/" ~/.zshrc
else
  echo "plugins=(git-prompt-anne)" >>~/.zshrc
fi
