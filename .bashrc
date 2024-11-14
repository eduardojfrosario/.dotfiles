#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

alias bashrc="nvim ~/.bashrc"
alias c="clear"
alias nf="fastfetch"
alias nv="nvim"
alias zzz="systemctl suspend"
alias kys="shutdown now"
alias cm="cmatrix"
alias nd="fastfetch --file ~/logo.txt"
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
alias winxp="jp2a ~/Pictures/xp.jpg --colors"
alias BS="jp2a ~/Pictures/batshrek.jpg --colors"
alias aqua="asciiquarium"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT1"
alias wifi="nm-connection-editor"
alias wp="python ~/.config/qtile/random_wallpaper.py"
alias rofisearch="~/.config/rofi/open_file.sh"
alias cd='z'
alias m='nvim .'
alias wisdom='fortune | cowsay -f stegosaurus'
alias figlet="figlet -f slant"
alias f="fzf"
alias rescan="nmcli device wifi rescan"
alias githelp="bat ~/.githelper.md"
alias matlab="~/matlab/bin/matlab"
alias githelp="bat ~/.githelp.md"
alias fdd="figlet 'ESTA FUDIDO'"
alias tetris="yetris"
# tldr => simple man
PS1='\w \$ '
# xdg-open to view html pages
export LC_ALL="en_US.UTF-8"

# Function to find and cd to a directory using fzf
fzf_cd() {
  local dir
  dir=$(find ~/ -type d | fzf) && cd "$dir"
}

fzf_/() {
  local dir
  dir=$(find / -type d | fzf) && cd "$dir"
}

# Key binding for Ctrl-F
bind -x '"\C-f": fzf_cd'

bind -x '"\C-_": fzf_/'

when

eval "$(zoxide init bash)"

eval "$(starship init bash)"

eval "$(ssh-agent -s)"

##-----------------------------------------------------
## alias
if [ -f /home/losg/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/losg/.config/synth-shell/alias.sh
fi


