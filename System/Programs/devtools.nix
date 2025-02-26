# System/Programs/devtools.nix

{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];  
}
