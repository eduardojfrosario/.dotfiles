# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
  export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

alias zshrc="nvim ~/.zshrc"
alias c="clear -x"
alias nf="fastfetch"
alias nv="nvim"
alias zzz="systemctl suspend"
alias kys="shutdown now"
alias cm="cmatrix"
alias nt="fastfetch --file ~/logo.txt"
alias win="fastfetch -l Windows"
alias among="fastfetch -l AmogOs"
alias anime="ani-cli -v -q 1080"
alias dub="ani-cli -v --dub -q 1080"
alias parrot="curl parrot.live"
alias NV="sudo mkdir -p /run/media/losg/New\ Volume"
alias MNV="sudo mount /dev/nvme0n1p4 '/run/media/losg/New Volume'"
alias LD="sudo mkdir -p /run/media/losg/8AFA9A88FA9A6FE5"
alias MLD="sudo mount /dev/nvme0n1p3 '/run/media/losg/8AFA9A88FA9A6FE5'"
alias disk="ncdu"
alias monkey="jp2a ~/Pictures/monke.jpeg --colors"
alias dog="jp2a ~/Pictures/dog.jpg --colors"
alias fate="jp2a ~/Pictures/dog-fate.jpg --colors"
alias winxp="jp2a ~/Pictures/xp.jpg --colors"
alias BS="jp2a ~/Pictures/batshrek.jpg --colors"
alias aqua="asciiquarium"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT1"
alias wifi="nm-connection-editor"
alias wp="python ~/.config/qtile/random_wallpaper.py"
alias rofisearch="~/.config/rofi/open_file.sh"
alias cd='z'
alias m='nvim .'
alias wisdom='fortune | cowsay -f actually'
alias figlet="figlet -f slant"
alias f="fzf"
alias rescan="nmcli device wifi rescan"
alias githelp="bat ~/.githelper.md"
alias matlab="~/matlab/bin/matlab"
alias githelp="bat ~/.githelp.md"
alias fdd="figlet 'ESTA FUDIDO'"
alias tetris="yetris"
alias vimrc="vim ~/.vimrc"

# xdg-open to view html pages
export LC_ALL="en_US.UTF-8"

export BROWSER="/usr/bin/zen-browser"

export PATH="/home/losg/.local/bin:$PATH"

# ANTLR
export CLASSPATH=".:/usr/local/lib/antlr-4.13.2-complete.jar:/usr/local/lib/ST-4.3.4.jar"
export ANTLR4_PATH="/usr/local/lib"


# Function to find and cd to a directory using fzf
fzf_cd() {
  local dir
  dir=$(find ~ -type d 2>/dev/null | fzf) && cd "$dir" || echo "No directory selected"
}


fzf_/() {
  local dir
  dir=$(find / -type d 2>/dev/null | fzf) && cd "$dir" || echo "No directory selected"
}


bindkey '^F' fzf_cd
bindkey '^_' fzf_/
bindkey '^Y' autosuggest-accept

when

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
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###
