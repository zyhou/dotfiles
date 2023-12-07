#!/usr/bin/env sh

# cargo dep

echo '[*] Install Rust'
curl https://sh.rustup.rs -sSf | sh

# starship minimal, blazing-fast, and infinitely customizable prompt
# https://starship.rs/
echo '[*] Install starship'
curl -sS https://starship.rs/install.sh | sh

# du => dust - https://github.com/bootandy/dust
echo '[*] Install dust to replace du'
cargo install du-dust

# find => fd - https://github.com/sharkdp/fd
echo '[*] Install fd to replace find'
cargo install fd-find

# bat - https://github.com/sharkdp/bat
echo '[*] Install bat'
cargo install --locked bat

# ripgrep - https://github.com/BurntSushi/ripgrep
echo '[*] Install ripgrep'
cargo install ripgrep

# tokei - https://github.com/XAMPPRocky/tokei
echo '[*] Install tokei'
cargo install tokei

# delta - https://github.com/dandavison/delta
echo '[*] Install Delta for Git'
cargo install git-delta

# Makefile => Justfile - https://github.com/casey/just
echo '[*] Install Just'
cargo install just

# ls => eza - https://github.com/eza-community/eza
echo '[*] Install Eza'
cargo install eza

# z (better cd) => zoxide - https://github.com/ajeetdsouza/zoxide
echo '[*] Install Zoxide'
cargo install zoxide

# bottom => htop - Bottom://github.com/ClementTsang/bottom
echo '[*] Install Zoxide'
cargo install bottom --locked
