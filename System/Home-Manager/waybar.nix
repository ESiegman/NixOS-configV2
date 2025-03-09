# System/Home-Manager/waybar.nix

{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
      
        modules-left = [
          "custom/nix"
          "hyprland/workspaces"
          "cpu"
          "memory"
          "custom/prev"
          "custom/playerctl"
          "custom/next"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "backlight"
          "pulseaudio"
          "bluetooth"
          "network"
          "battery"
          "tray"
        ];
        "custom/nix" = {
          format = " ";
          tooltip = false;
          on-click = "wlogout";
        };
        "hyprland/workspaces" = {
          format = "{name} {icon}";
          tooltip = false;
          all-outputs = true;
          format-icons = {
            active = "";
            default = "";
          };
        };
        "custom/prev" = {
          format = "";
          tooltip = false;
          on-click = "playerctl previous";
        };
        "custom/playerctl" = {
          format = "{}";
          interval = 1;
          exec = "/etc/nixos/System/Scripts/Waybar/media_control.sh 2> /dev/null";
          tooltip = false;
          on-click = "playerctl play-pause";
        };
        "custom/next" = {
          format = "";
          tooltip = false;
          on-click = "playerctl next";
        };
        "clock" = {
          format = "{:%m-%d %I:%M %p}";
        };
        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
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
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            headphone = "";
            default = [
              ""
              ""
              "󰕾"
              "󰕾"
              "󰕾"
              ""
              ""
              ""
            ];
          };
        };
        "bluetooth" = {
          format = " {}";
          format-disabled = "";
          on-click = "blueman-manager";
        };
        "network" = {
          format-wifi = "{essid} {percent}% ";
          format-ethernet = "Connected  ";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-applet";
        };
        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [
              "  "
              "  "
              "  "
              "  "
              "  "
          ];
          format-charging = "{icon} {capacity}%";
          tooltip = false;
        };
        "tray" = {
          icon-size = 20;
          spacing = 10;
        };
        "cpu" = {
          format = " {usage}%";
          interval = 1;
        };
        "memory" = {
          format = " {}%";
          interval = 1;
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag;
      ''
      /* Global styling */
      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 11px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 1px;
        margin-bottom: 1px;
      }

      window#waybar {
        background-color: transparent;
      }

      /* Custom styling for modules on the left */
      #custom-nix,
      #workspaces,
      #custom-playerctl,
      #custom-prev,
      #custom-next,
      #cpu,
      #memory {
        border-radius: 0;
        background-color: ${base01};
        color: ${base03};
        margin-top: 5px;
        margin-right: 5px;
        padding: 1px 10px;
      }

      #workspaces button,
      #custom-playerctl button,
      #custom-prev button,
      #custom-next button {
        background-color: ${base01};
        color: ${base03};
      }

      /* Custom styling for modules on the right */
      #clock,
      #backlight,
      #pulseaudio,
      #bluetooth,
      #network,
      #battery,
      #tray,
      #custom-vpn {
        border-radius: 0;
        background-color: ${base01};
        color: ${base03};
        margin-top: 5px;
        padding: 0 10px;
        margin-right: 5px;
      }

      /* Remove right margin and border on specific modules */
      #custom-nix,
      #bluetooth,
      #backlight,
      #cpu {
        margin-right: 0;
        border-radius: 0;
      }

      /* Remove left margin and border on specific modules */
      #pulseaudio,
      #network,
      #workspaces,
      #memory {
        margin-left: 0;
        border-radius: 0;
      }

      #custom-prev,
      #custom-playerctl,
      #custom-next {
        border-radius: 0;
        margin-left: 0;
        margin-right: 0;
        border-left: 1px solid ${base05};
      }

      #custom-nix {
        margin-left: 5px;
      }

      #custom-next,
      #workspaces,
      #memory,
      #pulseaudio,
      #network {
        border-radius: 0 10px 10px 0;
      }

      #custom-prev,
      #cpu,
      #custom-nix,
      #backlight,
      #bluetooth {
        border-radius: 10px 0 0 10px;
      }

      #custom-playerctl {
        border-radius: 0 0 0 0;
      }
      #clock,
      #battery,
      #tray {
        border-radius: 10px 10px 10px 10px;
      }
    '';
  };
}
