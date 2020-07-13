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

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_TIME_SHOW="false"
SPACESHIP_DIR_TRUNC_REPO="false"
SPACESHIP_BATTERY_THRESHOLD=34

DISABLE_AUTO_TITLE="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  dotenv
  ssh-agent
  z
  fzf
)

function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
