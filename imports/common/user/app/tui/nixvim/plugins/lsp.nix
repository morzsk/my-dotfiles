{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
            "<leader>ca" = "code_action";
          };
        };

        servers = {
          clangd.enable = true; # c/c++
		  omnisharp.enable = true; # c#
          lua_ls.enable = true; # lua 
		  html.enable = true; # html 
		  cssls.enable = true; # css
		  ts_ls.enable = true; # typescript
		  jdtls.enable = true; # java
		  nixd.enable = true; # nix
        };
      };
    };
  };
}
