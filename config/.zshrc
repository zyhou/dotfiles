export ZSH=/home/max/.oh-my-zsh
export TERM="xterm-256color"

DISABLE_AUTO_TITLE="true"

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_TIME_SHOW="false"
SPACESHIP_DIR_TRUNC_REPO="false"

SPACESHIP_BATTERY_THRESHOLD=34

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  ssh-agent
  dotenv
  z
)

ZSH_DOTENV_PROMPT=false

function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

source $ZSH/oh-my-zsh.sh

alias restartzsh="source ~/.zshrc"
alias cls="clear"
alias make="make --silent"
alias cat='bat'
alias c="code ."
alias zshrc="code ~/.zshrc"
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias sshconfig='code ~/.ssh/conf.d'

export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/opt/gradle/gradle-4.6/bin

export PATH="/home/max/anaconda3/bin:$PATH"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

export PATH=~/.local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export VISUAL=vi
export EDITOR="$VISUAL"

DEFAULT_USER=max

eval $(thefuck --alias)
eval "$(direnv hook $SHELL)"

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
