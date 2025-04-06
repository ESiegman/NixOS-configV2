# System/Programs/NixVim/lsp.nix

{ ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
        clangd.enable = true;
        ts_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        bashls.enable = true;
        jdtls.enable = true;
        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        nil_ls.enable = true;
        lua_ls.enable = true;
        ltex.enable = true;
        arduino_language_server.enable = true;
      };
    };
    lsp-lines.enable = true;
    lsp-signature = {
      enable = true;
      autoLoad = true;
    };
    lspkind.enable = true;
    nix.enable = true;
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
    };
  };
}
