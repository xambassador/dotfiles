function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # set fish_greeting
    # https://stackoverflow.com/questions/13995857/suppress-or-customize-intro-message-in-fish-shell
    set -U fish_greeting "~ When in doubt, use brute force."
    cat ~/.config/fish/ascii.txt | lolcat
end

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
fish_add_path /usr/local/go/bin/

alias ..='cd ..'
alias ...='cd ../..'
alias dl='cd ~/Downloads'
alias dv='cd ~/Developer'
alias dw='cd ~/Developer/workspace'
alias home='cd ~/'

alias g='git'
alias gs='git status'
alias gc='git commit'
alias gp='git pull'
alias gco="git checkout (git branch -a | fzf | tr -d ' *')"
alias gl="git log --oneline --decorate --color=always | fzf --ansi --preview 'git show {1}' | awk '{print \$1}' | xargs git show"
alias gstash='git stash list | fzf --preview="git stash show -p (string split ':' {} | head -n1)" | string split ':' | head -n1 | xargs -r git stash show -p'

alias cp='cp -v'
alias rm='rm -I'
alias yi='yarn install'
alias pi='pnpm install'
alias yd='yarn dev'
alias pd='pnpm dev'
alias yb='yarn build'
alias pb='pnpm build'
alias ls='eza -la --git --icons=always'
alias ll='eza -la --git --icons'
alias lsd='ls -lF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cat='bat'
alias fzp='nvim $(fzf --preview="bat --color=always {}")'
alias lsp='lsof -n -i | fzf'
alias fbrew="brew search '' | fzf | xargs brew install"
alias funbrew="brew list | fzf | xargs brew uninstall"
alias lbrew="brew list | fzf --preview='brew info {}'"
alias fenv="env | fzf"
alias vi="nvim"
alias n="nvim"

# go
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx EDITOR nvim

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :

# Starship init script
starship init fish | source
zoxide init fish | source

if status is-interactive
    atuin init fish | source
end
