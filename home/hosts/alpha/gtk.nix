{pkgs, ...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

  home.packages = with pkgs; [
    dconf
    whitesur-gtk-theme
    whitesur-icon-theme
  ];
}

