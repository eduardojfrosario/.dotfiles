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

    };
  };
}

