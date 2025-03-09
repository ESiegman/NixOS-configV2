# System/Programs/NixVim/Plugins/qol.nix

{ ... }:

{
  plugins = {
    autoclose = {
      enable = true;
      keys = {
        "(" = { escape = false; close = true; pair = "()"; };
        "[" = { escape = false; close = true; pair = "[]"; };
        "{" = { escape = false; close = true; pair = "{}"; };
        "\"" = { escape = true; close = true; pair = "\"\""; };
        "'" = { escape = true; close = true; pair = "''"; };
      };
    };
    compiler = {
      enable = true;
    };
    conform-nvim = {
      enable = true;
      settings = {
        formatter_by_ft = {
          python = [ "isort" "black" ];
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          java = [ "prettier" ];
          lua = [ "stylua" ];
          sh = [ "shfmt" ];
          nix = [ "nixpkgs_fmt" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          json = [ "jq" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          markdown = [ "prettier" ];
        };
      };
    };
    floaterm = {
      enable = true;
      autoclose = 2;
      autoinsert = true;
      shell = "zsh";
      keymaps = {
        new = "<leader>tn";
        kill = "<leader>tk";
        hide = "<leader>th";
        show = "<leader>ts";
      };
    };
    neogen = {
      enable = true;
      keymaps = {
        generate = "<leader>ng";
        generateClass = "<leader>nc";
        generateFile = "<leader>nf";
        generateFunction = "<leader>nf";
        generateType = "<leader>nt";
      };
    };
    neo-tree.enable = true;
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find Files";
            noremap = true;
            silent = true;
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Live Grep";
            noremap = true;
            silent = true;
          };
        };
        "<leader>fb" = {
          action = "bufferline";
          options = {
            desc = "Buffers";
            noremap = true;
            silent = true;
          };
        };
        "<leader>fh" = {
          action = "help_tags";
          options = {
            desc = "Help Tags";
            noremap = true;
            silent = true;
          };
        };
      };
    };
    which-key.enable = true; 
  };
}
