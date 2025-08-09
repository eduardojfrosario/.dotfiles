# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../system/common.nix
      ./hardware-configuration.nix
    ];

  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "alpha"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  virtualisation.docker = {
    enable  = true;
    rootless = {
      enable            = true;
      setSocketVariable = true;
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;

  # services.greetd = {
  #   enable   = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #       user    = "greeter";
  #     };
  #   };
  # };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };

  services.power-profiles-daemon.enable = true;

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
      powerManagement.enable       = true;
      modesetting.enable           = true;
      nvidiaSettings               = true;
      open                         = false;
      prime = {
        offload.enable = true;
        intelBusId  = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
  };
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_PL          = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "";
  services.gnome.gnome-keyring.enable = true;
  services.dbus.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.losg = {
    isNormalUser = true;
    description = "Losg";
    extraGroups = [ "networkmanager" "docker" "wheel" ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.hyprland.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wayland
     wl-clipboard
     xdg-desktop-portal-hyprland
     xdg-utils
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
  ];

  networking.firewall.enable = true;

  system.stateVersion = "25.05";
}
