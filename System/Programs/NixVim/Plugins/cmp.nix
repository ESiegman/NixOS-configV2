# System/Programs/NixVim/Plugins/cmp.nix

{ ... }:

{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completion.autoComplete = true;
      };
    };
    cmp-latex-symbols.enable = true;
    cmp-buffer.enable = true;
    cmp-calc.enable = true;
  };
}
