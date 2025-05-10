# System/Theme/stylix-wallpaper.nix

{ ... }:

let
  wallpaper = builtins.path {
    path = "/etc/nixos/System/Theme/Wallpapers/rustic.png";
    name = "wallpaper";
  };
in

{
  stylix = {
    image = wallpaper;
    targets.grub.enable = false;
  };
}

