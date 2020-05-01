export PURE_PROMPT_SYMBOL=λ

[[ $TMUX = "" ]] && export TERM="xterm-256color"

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/usr/local/google/home/aagundez/.oh-my-zsh"

export FZF_BASE=/usr/bin

export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

ZSH_THEME="robbyrussell"

plugins=(
    git
    tmuxinator
    fzf
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias day="base16_google-light"
alias night="base16_dracula"

alias vrc="nvim ~/.vimrc"
alias zrc="nvim ~/.zshrc && source ~/.zshrc"
alias trc="nvim ~/.tmux.conf && tmux source ~/.tmux.conf"

alias vim="nvim"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

stty -ixoff
stty stop undef
stty start undef

export FZF_DEFAULT_COMMAND='fd --type f'

autoload -U promptinit; promptinit
prompt pure

source /etc/bash_completion.d/g4d
tmux source ~/.tmux.conf
