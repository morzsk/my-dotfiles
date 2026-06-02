{ inputs, pkgs, lib, ... }:

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

  javaDebugServerDir = "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server";

  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
    lua
    nix
    typescript
    javascript
    java
    c_sharp
    rust
    zig
    c
    cpp
    bash
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
      rust-analyzer
      zls
      clang-tools
      bash-language-server
      stylua
      nixfmt
      prettier
      shfmt
      rustfmt
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

  xdg.configFile."nvim/lua/plugins/jdtls.lua".text =
    builtins.replaceStrings [ "$JDTLS_NVIM_DIR" "$JAVA_DEBUG_SERVER_DIR" ]
      [ "${pkgs.vimPlugins.nvim-jdtls}" javaDebugServerDir ]
      (builtins.readFile ./plugins/jdtls.lua);

  xdg.configFile."nvim/lua/plugins/rust.lua".text =
    builtins.replaceStrings [ "$RUSTACEANVIM_DIR" ] [ "${pkgs.vimPlugins.rustaceanvim}" ]
      (builtins.readFile ./plugins/rust.lua);

  xdg.configFile."nvim/lua/plugins/conform.lua".text =
    builtins.replaceStrings [ "$CONFORM_DIR" ] [ "${pkgs.vimPlugins.conform-nvim}" ]
      (builtins.readFile ./plugins/conform.lua);

  xdg.configFile."nvim/lua/plugins/dap.lua".text =
    builtins.replaceStrings [ "$DAP_DIR" "$CODELLDB_PATH" ]
      [ "${pkgs.vimPlugins.nvim-dap}"
        "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"
      ]
      (builtins.readFile ./plugins/dap.lua);

  xdg.configFile."nvim/lua/plugins/dap-ui.lua".text =
    builtins.replaceStrings [ "$DAP_UI_DIR" "$NIO_DIR" ]
      [ "${pkgs.vimPlugins.nvim-dap-ui}"
        "${pkgs.vimPlugins.nvim-nio}"
      ]
      (builtins.readFile ./plugins/dap-ui.lua);

  xdg.configFile."nvim/lua/plugins/dap-virtual-text.lua".text =
    builtins.replaceStrings [ "$DAP_VIRTUAL_TEXT_DIR" "$TREESITTER_DIR" ]
      [ "${pkgs.vimPlugins.nvim-dap-virtual-text}" "${treesitter}" ]
      (builtins.readFile ./plugins/dap-virtual-text.lua);

  home.activation.nvChadBarrier = lib.hm.dag.entryBetween [ "linkGeneration" ] [ "copyNvChad" ] "";

# mini-surround
}
