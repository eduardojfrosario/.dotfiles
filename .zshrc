export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh

export EDITOR='nvim'

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lav --ignore=..' 
alias l='ls -lav --ignore=".*"'

# shortcuts
alias zshrc="nvim ~/.zshrc"
alias c="clear"
alias nf="fastfetch"
alias zzz="systemctl suspend"
alias kys="shutdown now"
alias m='nvim .'
alias f="fzf"
# for hyprland
alias wp="~/.config/hypr/wp.sh"
# for qtile
# alias wp="python ~/.config/qtile/random_wallpaper.py"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT1"
alias open="xdg-open"
alias future="~/Documents/projects/future/main.sh"

# partitions
alias disk="ncdu"
alias LD="sudo mkdir -p /run/media/losg/8AFA9A88FA9A6FE5"
alias MLD="sudo mount /dev/nvme0n1p3 '/run/media/losg/8AFA9A88FA9A6FE5'"

# git
alias gs="git status"
alias ga="git add ."

# random
alias wisdom='fortune | cowsay -f actually'
alias figlet="figlet -f slant"

# xdg-open to view html pages
export LC_ALL="en_US.UTF-8"

export BROWSER="/usr/bin/zen-browser"

export PATH="/home/losg/.local/bin:$PATH"

# call future
future

# Function to find and cd to a directory using fzf
fzf_cd() {
  local dir
  dir=$(fd --type d . ~ | fzf) && cd "$dir" || echo "No directory selected"
}
zle -N fzf_cd


fzf_/() {
  local dir
  dir=$(fd --type d . / | fzf) && cd "$dir" || echo "No directory selected"
}
zle -N fzf_/


bindkey '^f' fzf_cd
bindkey '^[/' fzf_/
bindkey '^y' autosuggest-accept

# custom binds
bindkey -s "^Xgc" 'git commit -m ""\C-b'

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

eval "$(zoxide init zsh)"

eval "$(ssh-agent -s)" > /dev/null

eval "$(starship init zsh)"

### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
zle -N znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###

# better mv
autoload zmv

# hook that occurs whenever cd into dir
chpwd() {
    if [[ -d .venv ]]; then
        source .venv/bin/activate
    elif [[ -d venv ]]; then
        source venv/bin/activate
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
}
