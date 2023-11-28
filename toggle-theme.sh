#!/usr/bin/env sh
# Toggle dark and light themes for Linux Mint Mate App, tmux, alacritty
# and bat

CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)
ALACRITTYCONF="${HOME}/.config/alacritty/alacritty.yml"
TMUXCONF="${HOME}/.tmux.conf"
BATCONF="${HOME}/.config/bat/config"

# Toggle logic based on current mode
if [ "$CURRENT_MODE" = "'prefer-dark'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.mate.interface gtk-theme 'Catppuccin-Latte-Standard-Blue-Light'
    gsettings set org.mate.interface icon-theme 'Tela-circle'
    gsettings set org.mate.peripherals-mouse cursor-theme 'Catppuccin-Latte-Dark-Cursors'
    sed -i "s/catppuccin-mocha/catppuccin-latte/" "$ALACRITTYCONF"
    sed -i "s/@catppuccin_flavour 'mocha'/@catppuccin_flavour 'latte'/" "$TMUXCONF"
    sed -i "s/Catppuccin-mocha/Catppuccin-latte/" "$BATCONF"
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.mate.interface gtk-theme 'Catppuccin-Mocha-Standard-Blue-Dark'
    gsettings set org.mate.interface icon-theme 'Tela-circle-blue-dark'
    gsettings set org.mate.peripherals-mouse cursor-theme 'Catppuccin-Mocha-Dark-Cursors'
    sed -i "s/catppuccin-latte/catppuccin-mocha/" "$ALACRITTYCONF"
    sed -i "s/@catppuccin_flavour 'latte'/@catppuccin_flavour 'mocha'/" "$TMUXCONF"
    sed -i "s/Catppuccin-latte/Catppuccin-mocha/" "$BATCONF"
fi

tmux source-file "$TMUXCONF"