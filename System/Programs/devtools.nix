# System/Programs/devtools.nix

{pkgs, ... }:

with pkgs;
let
  r-packages = rWrapper.override{ packages = with rPackages; [ ggplot2 dplyr xts ]; };
in
{
  environment.systemPackages = with pkgs; [
    rstudio
    r-packages
    cargo
    wget
    curl
    gcc
    cmake
    clang
    python3
    jre
    nodejs
    typescript
    nixpkgs-fmt
    black
    isort
    clang-tools
    google-java-format
    shfmt
    stylua
    lua-language-server
    prettierd
    texlive.combined.scheme-full
    matlab
    arduino
    arduino-cli
    arduino-ide
    go_1_24
    screen
    usbutils
  ];  
}
