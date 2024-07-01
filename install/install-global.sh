#!/usr/bin/env sh

echo '[*] Install apt requierements ...'
sudo apt -y install apt-transport-https build-essential curl stow git zsh unzip fzf fastfetch

echo '[*] Make zsh the default shell ...'
chsh -s $(which zsh)

echo '[*] install oh-my-zsh ...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '[*] install fnm ...'
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fnm install --lts

echo '[*] install direnv ...'
curl -sfL https://direnv.net/install.sh | bash
