# System/Home-Manager/programs.nix

{ pkgs, ... }:

{
  programs = {
    eza = {
      enable = true;
      icons = "auto";
    };
    fzf.enable = true;
    bat.enable = true;
    fd = {
      enable = true;
      hidden = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    jq.enable = true;
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    btop.enable = true;
    ripgrep.enable = true;
    firefox = {
      enable = true;
    };
  };
  services.playerctld.enable = true;
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
