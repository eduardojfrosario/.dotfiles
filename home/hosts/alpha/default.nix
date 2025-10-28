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
    ./mako.nix
    ./nvim
    inputs.stylix.homeModules.stylix
  ];

  home.username = "losg";
  home.homeDirectory = "/home/losg";
  home.stateVersion = "23.11";

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";

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

    mako
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
    zip
    unzip
    p7zip
    unrar
    lshw
    usbutils
    udiskie
    udisks
    fzf
    tree
    btop
    kdePackages.kdeconnect-kde
    unrar
    ffmpeg

    ghostty

    mullvad

    docker
    docker-compose

    difftastic

    virt-manager
    qemu
    libvirt

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

    jdk
    maven


    # screen 
    wdisplays
    
    # apps
    obsidian
    libreoffice
    jetbrains.idea-ultimate
    jetbrains.datagrip
    gparted
    ani-cli
    pavucontrol
    vscode
    alacritty
    speedcrunch
    discord
    postman
    bleachbit

    # icons
    qogir-icon-theme

    # explorer
    nemo
    nemo-fileroller
    file-roller
    gvfs
    shared-mime-info
    xdg-utils
    ffmpegthumbnailer
    webp-pixbuf-loader

    # media
    mpv
    gthumb
    vlc

    # misc
    fastfetch

    # games
    prismlauncher
    superTux
    superTuxKart
    ttyper
  ];
}
