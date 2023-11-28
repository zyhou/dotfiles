#!/usr/bin/env sh

echo '[*] Removing default configurations ...'
rm -rf ~/.config/alacritty ~/.config/bat ~/.config/Code/User/settings.json ~/.gitconfig ~/.config/neofetch/config.conf ~/.config/nvim ~/.config/starship.toml ~/.tmux.conf ~/.zshrc

echo '[*] Stowing/Creating simlinks'
cd .. & stow -vSt ~ .fonts .icons .themes alacritty bat code git neofetch nvim starship tmux zsh

fc-cache -f -v
