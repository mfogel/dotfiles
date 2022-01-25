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
alias ls='gls --color=auto'
export LS_COLORS="$(vivid generate molokai)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# iterm2 tab titles
# https://superuser.com/a/292660
# https://superuser.com/a/735969
prmptcmd() { echo -ne "\e]1;$(dirs)\a" }
precmd_functions=(prmptcmd)

# lower case uuids
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

# fuzzy searching with fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}

# zplug init
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug plugins
zplug "Aloxaf/fzf-tab", at:e85f76a
zplug "jeffreytse/zsh-vi-mode", at:v0.8.5
zplug "lukechilds/zsh-nvm", at:23067bd
zplug "mattberther/zsh-pyenv", at:56a3081
zplug "zsh-users/zsh-autosuggestions", at:v0.7.0
zplug "zsh-users/zsh-syntax-highlighting", at:c7caf57, defer:2

# zplug load plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load # --verbose

# use neovim
alias vi='nvim'
