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

  xdg.configFile."nvim/lua/plugins/yazi.lua".text = ''
    return {
      name = "yazi.nvim",
      dir = "${pkgs.vimPlugins.yazi-nvim}",
      build = false,
      event = "VeryLazy",
      keys = {
        { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi" },
      },
      opts = {
        open_for_dir = false,
      },
    }
  '';
}
