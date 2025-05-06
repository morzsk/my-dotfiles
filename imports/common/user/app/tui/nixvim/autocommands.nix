{ config, pkgs, ... }:

{
  programs.nixvim = {
    autoCmd = [
      # Enable spellcheck for some filetypes
      {
        event = "FileType";
        pattern = [
          "tex"
          "latex"
          "markdown"
        ];
        command = "setlocal spell spelllang=en";
      }

      # Disable mini.indentscope on certain UI filetypes
      {
        event = "FileType";
        pattern = [
          "help"
          "Startup"
          "startup"
          "neo-tree"
          "Trouble"
          "trouble"
          "notify"
        ];
        callback = {
          __raw = ''
            function()
              vim.b.miniindentscope_disable = true
            end
          '';
        };
      }
    ];

    autoGroups = {
      indentscope = { };
      spellcheck = { };
    };
  };
}
