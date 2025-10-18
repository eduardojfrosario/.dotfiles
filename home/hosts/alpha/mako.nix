# home.nix
{
  services.mako = {
    enable = true;
    extraConfig = ''
      # Hide Blueman notifications (use both names just in case)
      [app-name="Blueman"]
      invisible=1

      [app-name="blueman-applet"]
      invisible=1
    '';
  };
}
