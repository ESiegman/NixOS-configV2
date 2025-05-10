# System/Programs/applications.nix

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmatrix
    cbonsai
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
    ffmpeg
    pandoc

    firefox

    obs-studio

    orca-slicer
    libreoffice
    freecad
    kicad
    zathura

    gimp
    vlc

    thunderbird

    zoom
    teams-for-linux
    pavucontrol

    wine
    samba
    winetricks

    prismlauncher
    r2modman
    tetrio-desktop

    obsidian
  ];
}
