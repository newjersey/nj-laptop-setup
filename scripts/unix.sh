#!/usr/bin/env bash

echo
echo "Installing utilities for unix development"

brew install wget

if [ -z "$ZSH" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh is already installed!"
fi
