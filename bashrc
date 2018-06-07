# brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# nice prompt
#export PS1='\[\e[0;33m\]\u@\h: \[\e[0;32m\]\w\[\e[0m\]\[\e[0;31m\]$(__git_ps1)\n\[\e[0;36m\]\@ \[\e[0;35m\][\!] \[\e[0;33m\]\$ \[\e[0m\]'
export PS1='\[\e[0;33m\]\u@\h \[\e[0;36m\]\t \[\e[0;32m\]\w/ \[\e[0;33m\]\$ \[\e[0m\]'
export PS2='\[\e[0;33m\]> \[\e[0m\]'
#export GIT_PS1_SHOWUPSTREAM=auto

# ls color output
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# bash readline in vi mode
set -o vi

# bash completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# android sdk installed via android studio
export ANDROID_HOME=~/Library/Android/sdk

# go commands
export PATH=~/go/bin:${PATH}

# pyenv
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
source '/usr/local/opt/nvm/nvm.sh'

# rbenv
eval "$(rbenv init -)"

# user home bin directory searched first, use for overrides
export PATH=~/bin:${PATH}
