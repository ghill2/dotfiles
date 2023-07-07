# https://stackoverflow.com/a/26647594/77814
echo "Setting correct permissions on folders that brew needs acccess to."
sudo chown -R `whoami`:admin /usr/local/bin
sudo chown -R `whoami`:admin /usr/local/share

# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update


echo "Cleaning up brew"
brew cleanup

Echo "Cask is already installed as part of Homebrew on Macs"
