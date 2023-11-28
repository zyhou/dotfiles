#!/usr/bin/env sh

echo '[*] Removing default configurations ...'
rm rf ~/.gitconfig ~/.config/nvim ~/.config/starship.toml ~/.tmux.conf ~/.zshrc

echo '[*] Stowing/Creating simlinks'
stow --verbose --dir .. --target ~ */
