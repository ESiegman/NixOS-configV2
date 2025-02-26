# System/Home-Manager/hyprland.nix

{ lib, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    xwayland.enable = true;
    settings = {
      general = {
        "gaps_in" = "2";
        "gaps_out" = "5";
        "border_size" = "2";
        "resize_on_border" = "false";
        "allow_tearing" = "true";
        "layout" = "dwindle";
        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base01})";
        "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";
      };

      decoration = {
        "rounding" = "2";

        "active_opacity" = "1";
        "inactive_opacity" = "1";

        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";
          "vibrancy" = "0.1696";
        };
      };

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, C, killactive,"
        "$mainMod, T, fullscreen"
        "$mainMod, V, togglefloating,"
        "$mainMod, J, togglesplit,"

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

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

        "$mainMod, Q, exec, kitty"
        "$mainMod, E, exec, thunar"
        "$mainMod, F, exec, wofi"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, W, exec, wlogout"
        "$mainMod, B, exec, firefox"
        "$mainMod SHIFT, B, exec, chromium --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --disable-gpu"
        "$mainMod, M, exec, spotify --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --disable-gpu"
        "$mainMod, D, exec, discord --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --no-sandbox --disable-gpu"
        "$mainMod, A, exec, /home/eren/scripts/theme/wallpaper.sh"

        ", Print, exec, sh -c 'hyprshot -m region output --clipboard-only'"
        "Shift, Print, exec, sh -c 'hyprshot -m window output --clipboard-only'"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      monitor = [
        "DP-1, 1920x1080@120, 0x0, 1"
#        "HDMI-A-1, 1920x1080@120, 0x0, 1, mirror, eDP-1"
        "eDP-1, 2880x1800@120, 1920x0, 1.8"
        ", preferred, auto, 1"
      ];
      exec-once = [
        "waybar &"
        "swww-daemon &"
      ];
    };
    extraConfig = ''
      xwayland {
        force_zero_scaling = true
      }
    '';
  };
}
