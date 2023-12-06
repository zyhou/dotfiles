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

https://pnpm.io/

https://www.nerdfonts.com/#home
sudo fc-cache -f -v # refresh cache font
bat cache --build # build bat theme

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
