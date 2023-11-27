# https://ohmyz.sh/

export ZSH="/home/max/.oh-my-zsh"

function zshtime() {
  for i in $(seq 1 10); do time zsh -i -c exit; done
}

export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--bind '?:toggle-preview'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)'
--bind 'ctrl-v:execute(code {+})'
"
export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude '.git' --exclude 'node_modules' --exclude 'build' --exclude 'dist'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

_fzf_compgen_path() {
    fd . "$1"
}
_fzf_compgen_dir() {
    fd --type d . "$1"
}

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  ssh-agent
  fzf
)

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
alias zshrc="code ~/.zshrc"
alias sshconfig='code ~/.ssh/conf.d'
alias myip='curl -4 ifconfig.co && curl -6 ifconfig.co'
alias open='xdg-open'
alias clipboard='xclip -selection clipboard'

export PATH="$PATH:/home/max/.fnm"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PNPM_HOME="/home/max/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="$PATH:/usr/bin/Postman"

# pnpm
export PNPM_HOME="/home/max/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
