# home.nix
{
  services.mako = {
    enable = true;
    extraConfig = ''
      default-timeout=3000
            
      [app-name="Blueman"]
      invisible=1

      [app-name="blueman-applet"]
      invisible=1

      [urgency=high]
      default-timeout=0
    '';
  };
}
