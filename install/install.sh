#!/usr/bin/env sh

echo '[*] Starting ...'
chmod +x *.sh

./install-zsh-tools.sh
./install-rust.sh
./stow-all.sh

source ~/.zshrc
