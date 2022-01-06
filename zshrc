# case-insensitive tab completion
# https://superuser.com/a/1092328
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# fancy prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
export PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{243}%2~%f%b %# '

# colors
# https://github.com/sharkdp/vivid
# https://superuser.com/a/707567
alias ls="gls --color=auto"
export LS_COLORS="$(vivid generate molokai)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# iterm2 tab titles
# https://superuser.com/a/292660
# https://superuser.com/a/735969
prmptcmd() { echo -ne "\e]1;$(dirs)\a" }
precmd_functions=(prmptcmd)
