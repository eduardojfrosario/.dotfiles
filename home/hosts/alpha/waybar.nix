{ config, pkgs, ... }:

{
  # Enable Waybar
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        # Basic bar configuration
        height = 30;
        spacing = 4;

        # Module layout
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
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

        # Module configurations
        "custom/separator" = {
          format = "•";
          tooltip = false;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
        };

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

    # CSS styling
    style = ''
            /* Waybar styles.css - CyberDream Theme */
            * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono", "Font Awesome 6 Free";
          font-size: 12px;
          min-height: 0;
          margin: 3px;
      }

      /* Main window */
      window#waybar {
          background-color: #16181a; /* base00 */
          border-bottom: 2px solid #3c4048; /* base02 */
          color: #ffffff; /* base05 */
          transition-property: background-color;
          transition-duration: 0.5s;
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
          background-color: #1e2124; /* base01 */
          color: #ffffff; /* base05 */
          border-radius: 10px;
          margin: 0 2px;
          transition: all 0.3s ease;
      }

      #workspaces button.active {
          background-color: #ff6e5e; /* base08 */
          color: #16181a; /* base00 */
          font-weight: bold;
      }

      #workspaces button.urgent {
          background-color: #ff6e5e; /* base08 */
          color: #16181a; /* base00 */
      }

      /* Custom separator */
      #custom-separator {
          color: #7b8496; /* base03 */
          margin: 0;
          font-size: 14px;
          padding: 0;
          background-color: transparent;
      }

      #custom-separator:hover {
          color: #5ea1ff; /* base04 */
      }

      /* Modules */
      #clock, #cpu, #memory, #backlight, #battery, #battery.bat2,
      #pulseaudio, #power-profiles-daemon, #tray {
          padding: 0 12px;
          margin: 0 4px;
          color: #ffffff; /* base05 */
          border-radius: 10px;
          transition: all 0.3s ease;
      }

      #clock:hover, #cpu:hover, #memory:hover, #backlight:hover, 
      #battery:hover, #battery.bat2:hover, #pulseaudio:hover,
      #tray:hover, #power-profiles-daemon:hover {
          background-color: #3c4048; /* base02 */
      }

      /* Individual module colors */
      #clock {
          font-weight: bold;
          color: #ffffff; /* base05 */
      }

      #cpu {
          color: #5ea1ff; /* base04 */
      }

      #memory {
          color: #f1ff5e; /* base0A */
      }

      #battery {
          color: #5eff6c; /* base0B */
      }

      #battery.charging {
          color: #5ea1ff; /* base04 */
      }

      #battery.warning:not(.charging) {
          background-color: #f1ff5e; /* base0A */
          color: #16181a; /* base00 */
      }

      #battery.critical:not(.charging) {
          background-color: #ff6e5e; /* base08 */
          color: #ffffff; /* base05 */
          animation: blink 0.5s linear infinite alternate;
      }

      @keyframes blink {
          to { background-color: #ff6e5e; } /* base08 */
      }

      #backlight {
          color: #f1ff5e; /* base0A */
      }

      #pulseaudio {
          color: #bd5eff; /* base0E */
      }

      #pulseaudio.muted {
          color: #7b8496; /* base03 */
      }

      #power-profiles-daemon {
          color: #5eff6c; /* base0B */
      }

      /* Tray styling */
      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #ff6e5e; /* base08 */
      }

      /* Tooltip styling */
      tooltip {
          background-color: #16181a; /* base00 */
          border: 1px solid #7b8496; /* base03 */
          border-radius: 8px;
          color: #ffffff; /* base05 */
      }

      tooltip label {
          color: #ffffff; /* base05 */
      }
    '';
  };

  # Enable fontconfig for proper font handling
  fonts.fontconfig.enable = true;

  # Required packages for functionality including fonts
  home.packages = with pkgs; [
    waybar
    pavucontrol # For audio control
    power-profiles-daemon # For power profiles
    jetbrains-mono # Font for waybar
    font-awesome # Icons for waybar
  ];
}
