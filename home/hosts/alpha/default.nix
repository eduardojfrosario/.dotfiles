{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar.nix
    ./spicetify.nix
    ./zsh.nix
    ./git.nix
    ./gammastep.nix
    ./alacritty.nix
    ./neovim.nix
    inputs.stylix.homeModules.stylix
  ];

  home.username      = "losg";
  home.homeDirectory = "/home/losg";
  home.stateVersion  = "23.11";


  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "Jetbrains Mono";
      };
    };
    icons = {
      enable = true;
      package = pkgs.whitesur-icon-theme;
      dark = "WhiteSur-dark";
      light = "WhiteSur";
    };
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages.x86_64-linux.twilight-official

    dunst swww grim slurp swayidle swappy hyprshot rofi-wayland hyprlock
    libsForQt5.qt5.qtwayland qt6.qtwayland libsForQt5.qtstyleplugin-kvantum
    brightnessctl playerctl
    networkmanagerapplet gammastep blueman

    SDL2 SDL2_image SDL2_ttf SDL2_mixer SDL2_sound SDL2_net SDL2_gfx

    ripgrep fd bottom gnupg pinentry unzip lshw usbutils udiskie udisks fzf tree btop
    wdisplays kdePackages.kdeconnect-kde unrar
    ffmpeg

    ghostty

    mullvad

    docker docker-compose

    difftastic

    # langs
    rustc cargo rust-analyzer wasm-pack
    gcc clang-tools gdb libcxx
    lldb lld
    mitscheme racket
    python3 uv ruff python312Packages.jedi-language-server
    bun nodejs typescript-language-server 

    # apps
    obsidian
    libreoffice
    jetbrains.idea-ultimate
    jetbrains.datagrip
    gparted
    ani-cli
    pavucontrol
    vscodium
    mullvad-browser
    alacritty
    speedcrunch
    discord

    # icons
    qogir-icon-theme

    # explorer
    nemo nemo-fileroller gvfs shared-mime-info xdg-utils ffmpegthumbnailer webp-pixbuf-loader

    # media
    feh mpv vlc

    # misc
    fastfetch

    # games
    prismlauncher
    superTux
    superTuxKart
  ];
}
