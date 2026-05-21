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
    
    # chadrcConfig = ''
    #   -- This file needs to have same structure as nvconfig.lua
    #   -- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
    #   -- Please read that file to know all available options :(

    #   ---@type ChadrcConfig
    #   local M = {}

    #   M.base46 = {
    #     theme = "yoru",

    #     -- hl_override = {
    #     -- 	Comment = { italic = true },
    #     -- 	["@comment"] = { italic = true },
    #     -- },
    #   }

    #   -- M.nvdash = { load_on_startup = true }
    #   -- M.ui = {
    #   --       tabufline = {
    #   --          lazyload = false
    #   --      }
    #   -- }

    #   return M
    # '';
  };
}
