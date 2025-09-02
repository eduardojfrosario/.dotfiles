{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [{
        monitor = "eDP-1";
        blur = true;
        blur_size = 8;
        blur_passes = 3;
      }];

      # Main password input field
      input-field = [{
        size = "350, 65";
        outline_thickness = 3;
        dots_size = 0.35;
        dots_spacing = 0.25;
        dots_center = true;
        outer_color = "rgba(24, 25, 38, 0.8)";
        inner_color = "rgba(30, 32, 48, 0.9)";
        font_color = "rgba(255, 255, 255, 1.0)";
        fade_on_empty = true;
        placeholder_text = "<span foreground=\"##a6adc8\">Enter Password</span>";
        hide_input = false;
        rounding = 15;
        position = "0, -50";
        halign = "center";
        valign = "center";
        monitor = "eDP-1";
        shadow_passes = 2;
        shadow_size = 8;
        shadow_color = "rgba(0, 0, 0, 0.4)";
        ignore_empty_input = true;
      }];

      # Labels for date, time, and username
      label = [
        # Date display
        {
          text = "cmd[update:1000] echo \"$(LC_TIME=en_US.UTF-8 date '+%A, %d %b')\"";
          font_family = "Hack Nerd Font";
          font_size = 32;
          color = "rgba(255, 255, 255, 0.9)";
          position = "0, 200";
          halign = "center";
          valign = "center";
          monitor = "eDP-1";
          shadow_passes = 1;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.6)";
        }
        # Time display (larger)
        {
          text = "cmd[update:1000] echo \"$(date '+%H:%M')\"";
          font_family = "Hack Nerd Font";
          font_size = 84;
          color = "rgba(255, 255, 255, 1.0)";
          position = "0, 120";
          halign = "center";
          valign = "center";
          monitor = "eDP-1";
          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgba(0, 0, 0, 0.7)";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    hyprlock
    nerd-fonts.hack
  ];

  stylix.targets.hyprlock.enable = false;
}
