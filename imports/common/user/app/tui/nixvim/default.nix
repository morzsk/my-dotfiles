{ config, pkgs, ... }:

{
    imports = [
        ./autocommands.nix
		./completion.nix
        ./keymappings.nix
        ./options.nix
        ./plugins
    ];

    programs.nixvim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;

		extraPlugins = with pkgs.vimPlugins; [
			coc-nvim
		];

        luaLoader.enable = true;
    };

}
