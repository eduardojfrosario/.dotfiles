{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    extraConfig = ''
      animations {
        enabled = false;
      }
    '';

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nemo";
      "$menu" = "rofi -show drun -show-icons";
      "$resize_px" = "20";

      env = [
        "XCURSOR_THEME,Qogir"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Qogir"
        "HYPRCURSOR_SIZE,24"
      ];

      monitor = [
        "eDP-1,1920x1080@165,0x0,1"
      ];

      exec-once = [
        "waybar & gammastep & nm-applet & blueman-applet & swww-daemon & dunst & mullvad-vpn &"
        "~/.dotfiles/home/hosts/alpha/scripts/hypr/wp.sh"
        "swayidle -w timeout 300 '~/.dotfiles/home/hosts/alpha/scripts/hypr/idle.sh' resume ''"
      ];

      input = {
        kb_layout = "pt";
        follow_mouse = 1;
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      bind = [
        # Basic binds
        "$mainMod, Return, exec, $terminal"
        "$mainMod, W, killactive,"
        "$mainMod SHIFT, Q, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, D, exec, $menu"
        "$mainMod CTRL, F, exec, zen"
        "$mainMod, R, exec, rofi -show run -show-icons"
        "$mainMod, V, togglefloating,"
        "$mainMod, C, exec, speedcrunch"
        "$mainMod, P, pseudo,"
        "$mainMod, F, fullscreen"
        "$mainMod, Tab, togglesplit,"
        "CTRL ALT, L, exec, ~/.dotfiles/home/hosts/alpha/scripts/hypr/lock.sh"

        # Extra binds
        "$mainMod, A, exec, ani-cli --rofi -v -q 1080"
        ",Print, exec, hyprshot hyprshot -m output --output-folder ~/Pictures/Screenshots"
        "SHIFT, Print, exec, hyprshot -m region --output-folder ~/Pictures/Screenshots"
        "$mainMod, Print, exec, hyprshot -m region --clipboard-only"

        # Move focus with vim keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Move focus with arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move windows with vim keys
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Move windows with arrow keys
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Resize binds (repeatable)
      binde = [
        # Resize with vim keys
        "$mainMod CTRL, H, resizeactive, -$resize_px 0"
        "$mainMod CTRL, L, resizeactive, $resize_px 0"
        "$mainMod CTRL, K, resizeactive, 0 -$resize_px"
        "$mainMod CTRL, J, resizeactive, 0 $resize_px"

        # Resize with arrow keys
        "$mainMod CTRL, left, resizeactive, -$resize_px 0"
        "$mainMod CTRL, right, resizeactive, $resize_px 0"
        "$mainMod CTRL, up, resizeactive, 0 -$resize_px"
        "$mainMod CTRL, down, resizeactive, 0 $resize_px"
      ];

      # Mouse binds
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Media keys (repeatable when held)
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Media control (non-repeatable)
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
