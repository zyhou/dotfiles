export ZSH=/home/max/.oh-my-zsh
export TERM="xterm-256color"

DISABLE_AUTO_TITLE="true"

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_TIME_SHOW="false"
SPACESHIP_DIR_TRUNC_REPO="false"

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  nvm-auto
  ssh-agent
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
alias c="code ."
alias zshrc="code ~/.zshrc"
alias sshconfig='code ~/.ssh/config'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

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

eval $(thefuck --alias)
eval "$(direnv hook $SHELL)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm_auto_switch
