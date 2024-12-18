{ config, pkgs, ... }:

{
  imports = [
    ./colorizer.nix
    ./comment.nix
    ./friendly-snippets.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    ./startify.nix
    ./telescope.nix
    ./treesitter.nix
	./web-devicons.nix
  ];
}
