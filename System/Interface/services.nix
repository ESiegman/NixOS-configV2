# System/Interface/services.nix

{ pkgs, lib, inputs, ... }:

let
  wallpaper = /home/eren/Pictures/wallpapers/sunset.jpg;
in

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = inputs.nixos-grub-theme.packages.${pkgs.system}.hyperfluent;
    };
    efi.canTouchEfiVariables = true;
  };
  systemd.services.systemd-modules-load.enable = true;

  services = {
    udev.enable = true;
    dbus.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "modesetting" "nvidia" ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      sugarCandyNix = {
        enable = true;
        settings = {
          Background = lib.cleanSource wallpaper;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
        };
      };
    };
    gvfs.enable = true;
    tumbler.enable = true;
  };
  
  security = {
    pam.services.hyprlock = {};
    polkit.enable = true;
  };

  time.timeZone = "America/New_York";
}
