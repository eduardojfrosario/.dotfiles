{ inputs, ... }:
let
  theme = inputs.themes.onedark;
in {
  xdg.configFile."btop/themes/base16.theme".text = theme.btopTheme;  

  programs.btop = {
    enable = true;
    settings.color_theme = "base16";
  };
}
