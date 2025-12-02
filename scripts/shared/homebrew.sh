echo


if is_program_installed brew; then
  echo "Homebrew is already installed!"
  already_installed+=("Homebrew")
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  newly_installed+=("Homebrew")
fi

echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup
