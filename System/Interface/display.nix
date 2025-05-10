# System/Interface/display.nix

{ pkgs, ... }:

{
  environment = {
    variables.XDG_RUNTIME_DIR = "/run/user/1000";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "0";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      libnotify
      waybar
      wofi
      brightnessctl
      wl-clipboard
      wlogout
      brightnessctl
      hyprshot
      playerctl
      mesa-demos
      glxinfo
      swaynotificationcenter
      xdg-desktop-portal
      base16-schemes
    ];
  };

  programs = {
    hyprland.enable = true;
    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [
          "hyprland"
        ];
      };
    };
  };
}
