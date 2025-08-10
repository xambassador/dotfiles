if status is-interactive
    # Commands to run in interactive sessions can go here
end

# path
fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin/
fish_add_path ~/.local/share/solana/install/active_release/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/bin
fish_add_path ~/bin/private
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.local/bin
fish_add_path ~/.deno/bin
fish_add_path /Users/yashramoliya/.spin/bin
fish_add_path /usr/local/go/bin/

# I am using nvchad for neovim
# https://www.lunarvim.org/
# alias nvim='lvim'

alias ..='cd ..'
alias ...='cd ../..'

alias dl='cd ~/Downloads'
alias dv='cd ~/Developer'
alias home='cd ~/'

# Git alias
alias g='git'
alias gs='git status'
# alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gc='git commit'
alias gp='git pull'

alias cp='cp -v'
alias rm='rm -I'

alias yi='yarn install'
alias pi='pnpm install'

alias ls='eza -la --git --icons'
alias ll='eza -la --git --icons'
alias lsd='ls -lF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cat='bat'
alias ip='echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;'

alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# alias python="python3"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# fzf
# fzf with preview using nvim
alias fzp='nvim $(fzf --preview="bat --color=always {}")'

# List all process
alias lsp='lsof -n -i | fzf'

# cd into from Developer directory
alias fsd="fd -t d . ~/Developer/ | fzf --height 50% --border --preview 'ls -la {}'"

# **** GIT ****
# Git checkout - switch branch
alias gco="git checkout (git branch -a | fzf | tr -d ' *')"

# Git log interactive
alias gl="git log --oneline | fzf --preview 'git show {1}' | awk '{print \$1}' | xargs git show"

# History
alias fh="eval (history | fzf)"

# Search installed brew packages
alias fbrew="brew search '' | fzf | xargs brew install"

# env
alias fenv="env | fzf"

# Kill any process
# alias fkill='kill "$(ps aux | fzf --height 50% --border --header "Select process to kill" --preview "echo {}" | awk "{print \$2}")"'

# Kill process by port (you type the port)
# alias fkill-port='kill "$(lsof -ti:$(echo "" | fzf --print-query --prompt "Enter port: "))"'

# More detailed process kill with preview
# alias fkill-detailed='kill "$(ps aux | fzf --height 50% --border --header "Select process to kill" --preview "ps -p {2} -o pid,ppid,cmd" --preview-window=right:50% | awk "{print \$2}")"'

# Kill process using specific port (interactive port selection)
# alias fkill-port-select='kill "$(lsof -i | grep LISTEN | fzf --height 50% --border --header "Select port to kill" --preview "echo {}" | awk "{print \$2}")"'

# go
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx EDITOR nvim

# zed
alias zed='open -a /Applications/Zed.app -n'


# Starship init script
starship init fish | source

# pnpm
set -gx PNPM_HOME "/Users/yashramoliya/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
zoxide init fish | source
