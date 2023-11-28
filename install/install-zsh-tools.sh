#!/usr/bin/env sh

# oh-my-zsh plugins

echo '[*] Install plugins oh-my-zsh zsh-completions'
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions

echo '[*] Install plugins oh-my-zsh zsh-autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions.git  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo '[*] Install plugins oh-my-zsh fast-syntax-highlighting'
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
