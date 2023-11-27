https://www.gnu.org/software/stow/

## Oh My Zsh

### Performance

In `oh-my-zsh.sh` file, inside the plugin loop add the performance stat

```sh
# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  timer=$(($(date +%s%N)/1000000))
  _omz_source "plugins/$plugin/$plugin.plugin.zsh"
  now=$(($(date +%s%N)/1000000))
  elapsed=$(($now-$timer))
  echo $elapsed":" $plugin
done
unset plugin
```

https://github.com/catppuccin

https://github.com/junegunn/fzf
https://ohmyz.sh/

- https://github.com/zsh-users/zsh-autosuggestions
- https://github.com/zdharma-continuum/fast-syntax-highlighting
- https://github.com/zsh-users/zsh-completions

https://github.com/sharkdp/fd
https://github.com/sharkdp/bat
https://code.visualstudio.com/
https://github.com/Schniz/fnm
https://starship.rs/
https://direnv.net/
https://pnpm.io/

- https://github.com/XAMPPRocky/tokei
- https://github.com/eza-community/eza
- https://github.com/ajeetdsouza/zoxide
- https://github.com/casey/just
- https://github.com/alacritty/alacritty
- https://github.com/BurntSushi/ripgrep
- https://github.com/bootandy/dust
- https://github.com/dandavison/delta

https://www.nerdfonts.com/#home
sudo fc-cache -f -v # refresh cache font

```sh
[includeIf "gitdir:~/bar/foo/"]
    path = ~/bar/foo/.gitconfig
```

~/.gitconfig.local

```sh
[user]
  name =
  email =
  signingkey =
```
