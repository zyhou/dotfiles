# https://ohmyz.sh/

export ZSH="/home/max/.oh-my-zsh"

function zshtime() {
  for i in $(seq 1 10); do time zsh -i -c exit; done
}

CURRENT_MODE="mocha"
if [[ "$CURRENT_MODE" == "latte" ]]; then
  export FZF_DEFAULT_OPTS="
  --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39
  --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78
  --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39
  "
  export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
else
  export FZF_DEFAULT_OPTS="
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  "
  export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444"
fi

# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--layout=reverse
--info=inline
--height=80%
--multi
--bind '?:toggle-preview'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)'
--bind 'ctrl-v:execute(nvim {+})'
"
export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude '.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

_fzf_compgen_path() {
    fdfind --hidden --follow --exclude '.git' . "$1"
}
_fzf_compgen_dir() {
    fdfind --hidden --follow --exclude '.git' --type d . "$1"
}

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  ssh-agent
  fzf
)

# https://starship.rs/advanced-config/#change-window-title
DISABLE_AUTO_TITLE="true"
function set_win_title(){
    echo -ne "\033]0; $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)

fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"
source $ZSH/oh-my-zsh.sh

alias restartzsh="omz reload"
alias cls="clear"
alias cat='bat'
alias fd=fdfind
alias l="eza --icons --all --group-directories-first"
alias ll="l --long --group"
alias tree="ll --tree --level=4 -I=.git --git-ignore"
alias c="code ."
alias n="nvim ."
alias pn="pnpm"
alias zshrc="nvim ~/.zshrc"
alias sshconfig='nvim ~/.ssh/conf.d'
alias myip='curl -4 ifconfig.co && curl -6 ifconfig.co'
alias open='xdg-open'
alias clipboard='xclip -selection clipboard'

export PATH="/home/max/.fnm:$PATH"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PNPM_HOME="/home/max/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="$PATH:/usr/bin/Postman"

# lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/mocha.yml"

# https://github.com/zdharma-continuum/fast-syntax-highlighting
fast-theme --quiet XDG:catppuccin-mocha

# pnpm
export PNPM_HOME="/home/max/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
