recommended_plugins="git"

if grep -q '^plugins=' ~/.zshrc; then
  existing_plugins=$(grep '^plugins=(' ~/.zshrc | sed 's/^plugins=(\(.*\))$/\1/' | tr -d '"' | tr -d "'")
  all_plugins="$existing_plugins $recommended_plugins"
  deduped_plugins=$(echo "$all_plugins" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')
  sed -i '' "s/^plugins=(.*)$/plugins=($deduped_plugins)/" ~/.zshrc
else
  echo "plugins=($recommended_plugins)" >> ~/.zshrc
fi

newly_installed+=("oh-my-zsh-plugins: $recommended_plugins")
