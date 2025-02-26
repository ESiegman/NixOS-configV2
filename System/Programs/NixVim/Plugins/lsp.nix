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
      };
    };
    lsp-lines.enable = true;
    lsp-signature.enable = true;
    lspkind.enable = true;
    lspsaga = {
      enable = true;
      ui = {
        collapse = "";
        expand = "";
      };
    };
    nix.enable = true;
  };
}
