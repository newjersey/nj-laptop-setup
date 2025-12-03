echo
echo "Installing Ruby tools and latest Ruby"

if is_brew_installed "rbenv"; then
    current=$(rbenv version)
    already_installed+=("rbenv: Ruby $current")
else
    brew install rbenv
    if [[ $? -ne 0 ]]; then
        failed+=("rbenv")
    else
        current=$(rbenv version)
        newly_installed+=("rbenv: Ruby $current")
    fi
fi

eval "$(rbenv init -)"
rbenv install $(rbenv install -l | grep -v - | tail -1) --skip-existing
rbenv global $(rbenv install -l | grep -v - | tail -1)
gem install bundler
rbenv rehash
