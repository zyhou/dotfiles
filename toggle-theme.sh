#!/usr/bin/env sh
# Toggle dark and light themes for Linux Mint Mate App, tmux, alacritty,
# nvim and bat

# Thanks to https://shapeshed.com/vim-tmux-alacritty-theme-switcher/

CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)
ALACRITTYCONF="./alacritty/.config/alacritty/alacritty.yml"
TMUXCONF="./tmux/.tmux.conf"
BATCONF="./bat/.config/bat/config"
GITCONF="./git/.gitconfig"
VIMCONF="./nvim/.config/nvim/lua/plugins/colorscheme.lua"
ZSHRC="./zsh/.zshrc"

# Toggle logic based on current mode
if [ "$CURRENT_MODE" = "'prefer-dark'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    sed -i "s/catppuccin-mocha/catppuccin-latte/" "$ALACRITTYCONF"
    sed -i "s/@catppuccin_flavour 'mocha'/@catppuccin_flavour 'latte'/" "$TMUXCONF"
    sed -i "s/Catppuccin-mocha/Catppuccin-latte/" "$BATCONF"
    sed -i "s/Catppuccin-mocha/Catppuccin-latte/" "$GITCONF"
    sed -i 's/catppuccin-mocha/catppuccin-latte/' "$VIMCONF"
    sed -i 's/mocha.yml/latte.yml/' "$ZSHRC" # Lazygit
    sed -i 's/XDG:catppuccin-mocha/XDG:catppuccin-latte/' "$ZSHRC" # fast-syntax-highlighting
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    sed -i "s/catppuccin-latte/catppuccin-mocha/" "$ALACRITTYCONF"
    sed -i "s/@catppuccin_flavour 'latte'/@catppuccin_flavour 'mocha'/" "$TMUXCONF"
    sed -i "s/Catppuccin-latte/Catppuccin-mocha/" "$BATCONF"
    sed -i "s/Catppuccin-latte/Catppuccin-mocha/" "$GITCONF"
    sed -i 's/catppuccin-latte/catppuccin-mocha/' "$VIMCONF"
    sed -i 's/latte.yml/mocha.yml/' "$ZSHRC" # Lazygit
    sed -i 's/XDG:catppuccin-latte/XDG:catppuccin-mocha/' "$ZSHRC" # fast-syntax-highlighting
fi

tmux source-file "$TMUXCONF"
exec zsh
