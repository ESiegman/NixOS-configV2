# System/Programs/NixVim/opts.nix

{ ... }:

{
  opts = {
    number = true;
    relativenumber = true;
    wrap = true;
    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    termguicolors = true;
    cursorline = true;
    scrolloff = 7;
    sidescrolloff = 7;
  };
}
