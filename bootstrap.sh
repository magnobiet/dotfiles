#!/bin/bash

set -e

DOTFILES_PATH="$HOME/.dotfiles"

if [ ! `which git` ]; then
  sudo apt install -y git
fi

if [ ! -d $DOTFILES_PATH ]; then
  git clone https://github.com/magnobiet/dotfiles.git $DOTFILES_PATH
fi

cd $DOTFILES_PATH
sudo ./install
