# System/Theme/stylix-wallpaper.nix

{ ... }:

let
  wallpaper = /home/eren/Pictures/wallpapers/cat.png;
in

{
  stylix = {
    image = wallpaper;
    targets.grub.enable = false;
  };
}
