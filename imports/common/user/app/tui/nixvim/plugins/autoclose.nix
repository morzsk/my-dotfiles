{ config, pkgs, ... }:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
	# autoLoad = true;	
  };
}
