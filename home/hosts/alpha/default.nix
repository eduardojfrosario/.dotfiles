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
    ./starship.nix
    ./ghostty.nix
    ./nvim
    inputs.stylix.homeModules.stylix
  ];

  home.username = "losg";
  home.homeDirectory = "/home/losg";
  home.stateVersion = "23.11";

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    override = {
      base00 = "16181a"; # bg
      base01 = "1e2124"; # bg_alt
      base02 = "3c4048"; # bg_highlight
      base03 = "7b8496"; # grey (comments / secondary text)
      base04 = "5ea1ff"; # blue (maybe for constants / highlights)
      base05 = "ffffff"; # fg
      base06 = "f1ff5e"; # yellow (bright fg accent)
      base07 = "ffffff"; # white (extra bright)
      base08 = "ff6e5e"; # red
      base09 = "ffbd5e"; # orange
      base0A = "f1ff5e"; # yellow
      base0B = "5eff6c"; # green
      base0C = "5ef1ff"; # cyan
      base0D = "5ea1ff"; # blue
      base0E = "bd5eff"; # purple
      base0F = "ff5ea0"; # pink
    };

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 24;
    };

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

    dunst
    swww
    grim
    slurp
    swayidle
    swappy
    hyprshot
    rofi-wayland
    hyprlock
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    brightnessctl
    playerctl
    networkmanagerapplet
    gammastep
    blueman

    SDL2
    SDL2_image
    SDL2_ttf
    SDL2_mixer
    SDL2_sound
    SDL2_net
    SDL2_gfx

    ripgrep
    fd
    bottom
    gnupg
    pinentry
    unzip
    lshw
    usbutils
    udiskie
    udisks
    fzf
    tree
    btop
    wdisplays
    kdePackages.kdeconnect-kde
    unrar
    ffmpeg

    ghostty

    mullvad

    docker
    docker-compose

    difftastic

    # langs
    rustc
    cargo
    rust-analyzer
    wasm-pack
    gcc
    clang-tools
    gdb
    libcxx
    lldb
    lld
    mitscheme
    racket
    python3
    uv
    ruff
    python312Packages.jedi-language-server
    bun
    nodejs
    typescript-language-server

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
    nemo
    nemo-fileroller
    gvfs
    shared-mime-info
    xdg-utils
    ffmpegthumbnailer
    webp-pixbuf-loader

    # media
    feh
    mpv
    vlc

    # misc
    fastfetch

    # games
    prismlauncher
    superTux
    superTuxKart
  ];
}
