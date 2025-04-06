{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
  {
    programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblockify
       hidePodcasts
       fullAppDisplay
       groupSession
       shuffle 
       oneko
     ];
     theme = spicePkgs.themes.text;
     colorScheme = "rosepine";
    };
  }
