# System/Programs/NixVim/nixvim.nix

{ ... }:

{
  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    imports = [
      # Settings
      ./keybinds.nix
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
