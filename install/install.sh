#!/usr/bin/env sh

echo '[*] Starting ...'

./install-zsh-tools.sh
./install-rust.sh
./stow-all.sh

source ~/.zshrc
