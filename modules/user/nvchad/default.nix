{ inputs, pkgs, ... }:

{
  imports = [ inputs.nix4nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nil
      typescript-language-server
    ];

    extraConfig = ''
      vim.lsp.enable({'nil_ls', 'ts_ls'})
    '';
    
    chadrcConfig = ''
      local M = {}
      M.base46 = { theme = "yoru" }
      return M
    '';
  };
}
