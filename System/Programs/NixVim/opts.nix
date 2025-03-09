# System/Programs/NixVim/opts.nix

{ ... }:

{
  opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    wrap = true;
    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    termguicolors = true;
    cursorline = true;
    scrolloff = 7;
    sidescrolloff = 7;
    clipboard.providers.wl-copy.enable = true;
  };

  globals.mapleader = " ";
    
  keymaps = [
    {
      action = "::lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
      key = "<leader>cc";
      options = {
        noremap = true;
        silent = true;
      };
    }
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
}
