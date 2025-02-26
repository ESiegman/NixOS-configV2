# System/Programs/applications.nix

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmatrix
    tgpt
    ueberzug
    ueberzugpp
    zip
    unzip
    power-profiles-daemon
    swww
    bind
    thefuck
    taskwarrior3
    nvitop

    obs-studio

    orca-slicer
    libreoffice
    freecad
    zathura

    gimp
    vlc

    spotify

    zoom
    teams-for-linux
    pavucontrol

    wine
    samba
    winetricks

    prismlauncher
    r2modman

    tor-browser
  ];
}
