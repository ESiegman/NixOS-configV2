# System/Theme/stylix-wallpaper.nix

{ ... }:

let
  wallpaper = /etc/nixos/System/Theme/Wallpapers/blossoms.jpg;
in

{
  stylix = {
    image = wallpaper;
    targets.grub.enable = false;
  };
}
