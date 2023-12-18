#!/usr/bin/env sh

# https://www.gnu.org/software/stow/

echo '[*] Removing default configurations ...'
rm -rf ~/.config/alacritty ~/.config/bat ~/.config/Code/User/settings.json ~/.gitconfig ~/.config/neofetch/config.conf
rm -rf ~/.config/nvim ~/.config/starship.toml ~/.config/fsh ~/.tmux.conf ~/.config/lazygit/config.yml

echo '[*] Stowing/Creating simlinks'
cd .. && stow -vSt ~ .fonts alacritty bat code git neofetch nvim starship tmux zsh fsh lazygit

# refresh cache font
# https://linux.die.net/man/1/fc-cache
fc-cache -f -v

# To add catppuccin theme to the bat theme list `bat --list-themes`
# https://github.com/sharkdp/bat
bat cache --build
