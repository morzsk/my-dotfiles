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
          clangd.enable = true;
          lua_ls.enable = true;
		  jdtls.enable = true;	
		  # rnix_lsp.enable = true;
		  # ts-ls.enable = true;
        };
      };
    };
  };
}
