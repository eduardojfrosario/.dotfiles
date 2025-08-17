{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 30;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "custom/separator"
          "backlight"
          "custom/separator"
          "power-profiles-daemon"
          "custom/separator"
          "cpu"
          "custom/separator"
          "memory"
          "custom/separator"
          "tray"
          "custom/separator"
          "battery"
        ];

        "custom/separator" = {
          format = "•";
          tooltip = false;
        };

        tray.spacing = 10;

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory.format = "{}% ";

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      /* Waybar Kanagawa Theme */
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono", "Font Awesome 6 Free";
          font-size: 12px;
          min-height: 0;
          margin: 3px;
      }

      /* Main bar */
      window#waybar {
          background-color: #1F1F28; /* base00 */
          border-bottom: 2px solid #223249; /* base02 */
          color: #DCD7BA; /* base05 */
          transition: background-color 0.5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /* Workspaces */
      #workspaces {
          margin: 0 4px;
      }

      #workspaces button {
          padding: 0 8px;
          background-color: #2A2A37; /* base01 */
          color: #DCD7BA; /* base05 */
          border-radius: 10px;
          margin: 0 2px;
          transition: all 0.3s ease;
      }

      #workspaces button.active {
          background-color: #C34043; /* base0D */
          color: #1F1F28; /* base00 */
          font-weight: bold;
      }

      #workspaces button.urgent {
          background-color: #C34043; /* base08 */
          color: #1F1F28; /* base00 */
      }

      /* Separator */
      #custom-separator {
          color: #727169; /* base03 */
          margin: 0;
          font-size: 14px;
          padding: 0;
          background-color: transparent;
      }

      #custom-separator:hover {
          color: #C8C093; /* base04 */
      }

      /* Modules */
      #clock, #cpu, #memory, #backlight, #battery, #pulseaudio,
      #power-profiles-daemon, #tray {
          padding: 0 12px;
          margin: 0 4px;
          border-radius: 10px;
          color: #DCD7BA; /* base05 */
          transition: all 0.3s ease;
      }

      #clock:hover, #cpu:hover, #memory:hover, #backlight:hover,
      #battery:hover, #pulseaudio:hover, #power-profiles-daemon:hover,
      #tray:hover {
          background-color: #223249; /* base02 */
      }

      /* Individual colors */
      #clock {
          font-weight: bold;
          color: #DCA561; /* base0A */
      }

      #cpu {
          color: #7FB4CA; /* base0C */
      }

      #memory {
          color: #DCA561; /* base0A */
      }

      #backlight {
          color: #FFA066; /* base09 */
      }

      #battery {
          color: #98BB6C; /* base0B */
      }

      #battery.charging {
          color: #7FB4CA; /* base0C */
      }

      #battery.warning:not(.charging) {
          background-color: #DCA561; /* base0A */
          color: #1F1F28; /* base00 */
      }

      #battery.critical:not(.charging) {
          background-color: #C34043; /* base08 */
          color: #DCD7BA; /* base05 */
          animation: blink 0.5s linear infinite alternate;
      }

      @keyframes blink {
          to { background-color: #C34043; } /* base08 */
      }

      #pulseaudio {
          color: #957FB8; /* base0E */
      }

      #pulseaudio.muted {
          color: #727169; /* base03 */
      }

      #power-profiles-daemon {
          color: #98BB6C; /* base0B */
      }

      /* Tray */
      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #C34043; /* base08 */
      }

      /* Tooltips */
      tooltip {
          background-color: #1F1F28; /* base00 */
          border: 1px solid #727169; /* base03 */
          border-radius: 8px;
          color: #DCD7BA; /* base05 */
      }

      tooltip label {
          color: #DCD7BA; /* base05 */
      }
    '';
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    waybar
    pavucontrol
    power-profiles-daemon
    jetbrains-mono
    font-awesome
  ];
}
