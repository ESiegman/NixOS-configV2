# System/Programs/NixVim/nixvim.nix

{ ... }:

{
  programs.nixvim = {
    enable = true;
    imports = [
      # Settings
      ./opts.nix

      # Plugins
      ./Plugins/ai.nix
      ./Plugins/cmp.nix
      ./Plugins/dashboard.nix
      ./Plugins/gui.nix
      ./Plugins/lsp.nix
      ./Plugins/qol.nix
    ];
  };
}
