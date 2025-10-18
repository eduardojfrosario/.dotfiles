# home.nix
{
  services.mako = {
    enable = true;
    extraConfig = ''
      default-timeout=3000
            
      [app-name="blueman"]
      invisible=1

    '';
  };
}
