# System/Programs/keybinds.nix

{ ... }:

{
  opts = {
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        action = ":Neotree close<CR>";
        key = "<M-r>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":Neotree<CR>";
        key = "<M-e>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabnew<CR>";
        key = "<M-t>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":bdelete<CR>";
        key = "<M-w>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabnext<CR>";
        key = "<M-Right>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        action = ":tabprevious<CR>";
        key = "<M-Left>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
