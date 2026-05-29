{ inputs, pkgs, ... }:

let
  nvim-unity-sync = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-unity-sync";
    src = pkgs.fetchFromGitHub {
      owner = "apyra";
      repo = "nvim-unity-sync";
      rev = "b556e5adaf05e69626e23025a969a981e4eeaf32";
      hash = "sha256-keRm3qvvyLi3otKwKoPF8XULoDehYt3SGIzgUP+vhrk=";
    };
  };

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
      lsof
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

  xdg.configFile."nvim/lua/plugins/unity.lua".text =
    builtins.replaceStrings [ "$UNITY_NVIM_DIR" ] [ "${pkgs.vimPlugins.nvim-unity}" ]
      (builtins.readFile ./plugins/unity.lua);

  xdg.configFile."nvim/lua/plugins/unity-sync.lua".text =
    builtins.replaceStrings [ "$UNITY_SYNC_DIR" ] [ "${nvim-unity-sync}" ]
      (builtins.readFile ./plugins/unity-sync.lua);

  xdg.configFile."nvim/lua/plugins/opencode.lua".text =
    builtins.replaceStrings [ "$OPENCODE_NVIM_DIR" ] [ "${pkgs.vimPlugins.opencode-nvim}" ]
      (builtins.readFile ./plugins/opencode.lua);
}
