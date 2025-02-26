# System/Programs/NixVim/Plugins/ai.nix

{ ... }:

{
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "copilot";
        mappings = {
          ask = "<leader>aa";
          edit = "<leader>ae";
          refresh = "<leaderar>";
        };
      };
    };
    copilot-lua = {
      enable = true;
      suggestion = {
        autoTrigger = true;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
    };
  };
}
