#!/bin/sh

# Install xcode command line tools without popups
# https://wilsonmar.github.io/xcode/
# how to uninstall here: https://wilsonmar.github.io/xcode/

# Set XCode to main Xcode tools
# sudo xcode-select --switch /Applications/Xcode.app

# Set XCode app to main Xcode tools
# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# Create placeholder file checked by CLI updates' .dist code in Apple's SUS catalog:
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;

# Find the CLI Tools update:
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
# Unless "No new software available.", install it:
softwareupdate -i "$PROD" -v;