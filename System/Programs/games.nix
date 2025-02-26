# System/Programs/games.nix

{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    lutris
  ];
  # To access features, add the following to Steam launch options for games
  # gamemoderun %command%
  # mangohud %command%
  # gamescope %command%
  # Run the following in terminal to install proton GE on your system
  # protonup

  # use www.protondb.com to check compatibility of games with proton
}
