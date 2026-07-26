# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

export PATH=/opt/homebrew/bin:$PATH
export PATH=~/.bun/bin/:$PATH
export PATH=~/.local/share/solana/install/active_release/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/bin/private:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

alias ..='cd ..'
alias ...='cd ../..'

alias dl='cd ~/Downloads'

alias g='git'
alias gs='git status'

alias cp='cp -v'
alias rm='rm -I'

alias ls='exa -la --git --icons'
alias ll='exa -la --git --icons'
alias lsd='ls -lF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cat='bat'
alias ip='echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;'

alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

alias python='python3'

source $ZSH/oh-my-zsh.sh
