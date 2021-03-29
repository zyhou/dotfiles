export ZSH="/home/max/.oh-my-zsh"

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

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  fast-syntax-highlighting
  ssh-agent
  z
  fzf
)

function set_win_title(){
    echo -ne "\033]0; $(basename $PWD) \007"
}
precmd_functions+=(set_win_title)

source $ZSH/oh-my-zsh.sh

alias restartzsh="source ~/.zshrc"
alias cls="clear"
alias make="make --silent"
alias cat='bat'
alias fd=fdfind
alias c="code ."
alias zshrc="code ~/.zshrc"
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias sshconfig='code ~/.ssh/conf.d'
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest' # docker pull amazon/aws-cli:latest

autoload -U compinit && compinit

export PATH=/home/max/.fnm:$PATH
export FNM_LOGLEVEL=quiet
eval "$(fnm env)"

autoload -U add-zsh-hook
_fnm_autoload_hook () {
  if [[ -f .node-version && -r .node-version ]]; then
    echo "fnm: Found .node-version"
    fnm use
  elif [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"
    fnm use
  else
	fnm use default
  fi
}
add-zsh-hook chpwd _fnm_autoload_hook && _fnm_autoload_hook

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
