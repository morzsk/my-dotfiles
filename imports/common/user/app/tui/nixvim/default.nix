{ config, pkgs, ... }:

{
    imports = [
        ./autocommands.nix
		#        ./completion.nix
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

		extraConfigLua = ''
			vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif vim.fn["coc#expandableOrJumpable"]() then
    return vim.fn["coc#rpc#request"]("snippetNext", {})
  elseif check_back_space() then
    return "<Tab>"
  else
    return vim.fn["coc#refresh"]()
  end
end, { expr = true, silent = true })

vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<C-h>"
  end
end, { expr = true, silent = true })

function check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end
		'';

        luaLoader.enable = true;
    };

}
