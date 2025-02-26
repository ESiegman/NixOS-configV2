# System/Theme/stylix-wallpaper.nix

{ ... }:

let
  wallpaper = /home/eren/Pictures/wallpapers/demolition_lovers.png;
in

{
  stylix = {
    image = wallpaper;
    targets.grub.enable = false;
  };
}
