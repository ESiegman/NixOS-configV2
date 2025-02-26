# System/Programs/NixVim/Plugins/gui.nix

{ ... }:

{
  plugins = {
    baleia = {
      enable = true;
      settings = {
        async = true;
        colors = "NR_8";
        line_starts_at = 1;
        log = "INFO";
        name = "BaleiaColors";
        strip_ansi_codes = true;
      };
    };
    bufferline = {
      enable = true;
      settings.options = {
        always_show_bufferline = true;
        auto_toggle_bufferline = true;
        buffer_close_icon = "";
        close_command = "bdelete! %d";
        close_icon = "";
        color_icons = true;
        diagnostics = "nvim_lsp";
        diagnostics_update_on_event = true;
        duplicate_across_groups = true;
        enforce_regular_tabs = false;
        left_trunc_marker = "";
        max_name_length = 18;
        max_prefix_length = 15;
        mode = "buffers";
        modified_icon = "●";
      };
    };
    cursorline = {
      enable = true;
      cursorline.number = true;
      cursorword.enable = true;
    };
    hmts.enable = true;
    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          filetypes = [
            "help"
            "dashboard"
            "neogitstatus"
            "neo-tree"
            "Trouble"
          ];
          buftypes = [
            "terminal"
            "nofile"
          ];
        };
        scope.enabled = false;
      };
    };
    lualine = {
      enable = true;
      settings = {
        options = {
          sections = {
            lualine_a = "mode";
            lualine_b = [
              "branch"
              "diff"
              "diagnostics"
            ];
            lualine_c = "filename";
            lualine_x = [
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = "progress";
            lualine_z = "location";
          };
        };
      };
    };
    navic = {
      enable = true;
      settings = {
        click = true;
        depth_limit = 5;
        highlight = true;
        seperator = " > ";
      };
    };
    noice.enable = true;
    notify.enable = true;
    nui.enable = true;
    scrollview.enable = true;
    treesitter = {
      enable = true;
      settings.ensure_installed = "all";
    };
    web-devicons.enable = true;
    wilder.enable = true;
    yazi.enable = true;
  };
}
