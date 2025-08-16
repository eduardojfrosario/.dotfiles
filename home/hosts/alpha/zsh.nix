{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    
    # Enable command auto-correction
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # History configuration
    history = {
      size = 10000;
      ignoreDups = true;
    };
    
    # Shell options
    historySubstringSearch.enable = true;
    
    # Environment variables
    sessionVariables = {
      EDITOR = "nvim";
      LC_ALL = "en_US.UTF-8";
    };
    
    # Aliases
    shellAliases = {
      # Basic commands with colors
      ls = "ls --color=auto";
      la = "ls -A --color=auto";
      grep = "grep --color=auto";
      ll = "ls -lav --ignore=..";
      l = "ls -lav --ignore=.?*";
      
      # Shortcuts
      zshrc = "nvim ~/.zshrc";
      c = "clear -x";
      nf = "fastfetch";
      zzz = "systemctl suspend";
      kys = "shutdown now";
      m = "nvim .";
      f = "fzf";
      githelp = "bat ~/.githelp.md";
      wp = "~/.dotfiles/home/hosts/alpha/scripts/hypr/wp.sh";
      cd = "z";
      battery = "upower -i /org/freedesktop/UPower/devices/battery_BAT1";
      
      # Partitions
      disk = "ncdu";
      NV = "sudo mkdir -p /run/media/losg/New\\ Volume";
      MNV = "sudo mount /dev/nvme0n1p4 '/run/media/losg/New Volume'";
      LD = "sudo mkdir -p /run/media/losg/8AFA9A88FA9A6FE5";
      MLD = "sudo mount /dev/nvme0n1p3 '/run/media/losg/8AFA9A88FA9A6FE5'";
      
      # Random/Entertainment
      anime = "ani-cli -v -q 1080";
      dub = "ani-cli -v --dub -q 1080";
      wisdom = "fortune | cowsay -f actually";
      figlet = "figlet -f slant";
      
      # ZNT aliases
      naliases = "n-aliases";
      ncd = "n-cd";
      nenv = "n-env";
      nfunctions = "n-functions";
      nhistory = "n-history";
      nkill = "n-kill";
      noptions = "n-options";
      npanelize = "n-panelize";
      nhelp = "n-help";
    };
    
    # Custom functions and additional configuration
    initContent = ''
      # Enable command correction
      setopt CORRECT
      
      # Set options for history and directory navigation
      setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
      
      # Function to find and cd to a directory using fzf
      fzf_cd() {
        local dir
        dir=$(find ~ -type d 2>/dev/null | fzf) && cd "$dir" || echo "No directory selected"
      }
      
      fzf_/() {
        local dir
        dir=$(find / -type d 2>/dev/null | fzf) && cd "$dir" || echo "No directory selected"
      }
      
      # Key bindings
      bindkey '^F' fzf_cd
      bindkey '^_' fzf_/
      bindkey '^Y' autosuggest-accept
      bindkey '^R' znt-history-widget
      
      # Initialize external tools
      eval "$(zoxide init zsh)"
      eval "$(ssh-agent -s)" > /dev/null
      eval "$(starship init zsh)"
      
      # ZNT (Zsh Navigation Tools) configuration
      if [[ -d "$HOME/.config/znt/zsh-navigation-tools" ]]; then
        fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
        autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
        autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
        zle -N znt-history-widget
        zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
      fi
    '';
  };
  
  # Required packages for your configuration
  home.packages = with pkgs; [
    # Core utilities
    neovim
    fzf
    zoxide
    starship
    bat
    fastfetch
    ncdu
    when
    
    # Entertainment
    fortune
    cowsay
    figlet
    
    # File management and system tools
    upower
  ];
  
  # Additional programs configuration
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.starship.enable = true;
  programs.bat.enable = true;
}
