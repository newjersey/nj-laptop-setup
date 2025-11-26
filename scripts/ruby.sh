echo
echo "Installing Ruby tools and latest Ruby"

brew install rbenv
eval "$(rbenv init -)"
rbenv install $(rbenv install -l | grep -v - | tail -1) --skip-existing
rbenv global $(rbenv install -l | grep -v - | tail -1)
gem install bundler
rbenv rehash