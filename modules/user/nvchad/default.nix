{ inputs, pkgs, ... }:

let
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
    lua
    nix
    typescript
    javascript
    java
    c_sharp
  ]);
in
{
  imports = [ inputs.nix4nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nil
      typescript-language-server
      omnisharp-roslyn
      dotnet-sdk
      jdt-language-server
    ];

    extraConfig = builtins.readFile ./extra.lua;
    chadrcConfig = builtins.readFile ./chadrc.lua;
  };

  xdg.configFile."nvim/lua/themes/gruvbox_amoled.lua".source = ./themes/gruvbox_amoled.lua;

  xdg.configFile."nvim/lua/plugins/yazi.lua".text =
    builtins.replaceStrings [ "$YAZI_NVIM_DIR" ] [ "${pkgs.vimPlugins.yazi-nvim}" ]
      (builtins.readFile ./plugins/yazi.lua);

  xdg.configFile."nvim/lua/plugins/project.lua".text =
    builtins.replaceStrings [ "$PROJECT_NVIM_DIR" ] [ "${pkgs.vimPlugins.project-nvim}" ]
      (builtins.readFile ./plugins/project.lua);

  xdg.configFile."nvim/lua/plugins/treesitter.lua".text =
    builtins.replaceStrings [ "$TREESITTER_DIR" "$TREESITTER_PARSER_DIR" ] [ "${treesitter}" "${treesitter}/parser" ]
      (builtins.readFile ./plugins/treesitter.lua);
}
