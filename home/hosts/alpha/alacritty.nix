{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 1.0;
        padding = {
          x = 5;
          y = 5;
        };
      };

      env = {
        WINIT_X11_SCALE_FACTOR = "1";
      };

      font = {
        size = 12;
        normal.family = "Hack Nerd Font Mono";
      };

      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };

        normal = {
          black   = "#282c34";
          red     = "#e06c75";
          green   = "#98c379";
          yellow  = "#e5c07b";
          blue    = "#61afef";
          magenta = "#c678dd";
          cyan    = "#56b6c2";
          white   = "#abb2bf";
        };

        bright = {
          black   = "#5c6370";
          red     = "#e06c75";
          green   = "#98c379";
          yellow  = "#e5c07b";
          blue    = "#61afef";
          magenta = "#c678dd";
          cyan    = "#56b6c2";
          white   = "#ffffff";
        };
      };
    };
  };
}

