{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "  ";
      };

      modules = [
        { type = "custom";   format = "── System ────────────────────"; }
        { type = "command";  key = "  OS           ";  text = ". /etc/os-release && echo \"$PRETTY_NAME + Home-Manager\""; }
        { type = "wm";       key = "  WM           "; }
        { type = "command";  key = "  DM           ";  text = "ly --version 2>/dev/null | head -1 || echo Ly"; }
        { type = "shell";    key = "  Shell        "; }
        { type = "command";  key = "  Notifications";  text = "mako --version 2>/dev/null | head -1 || echo Mako"; }
        { type = "command";  key = "  Fetch        ";  text = "fastfetch --version | head -1"; }

        { type = "custom";   format = "── Apps ──────────────────────"; }
        { type = "command";  key = "  Launcher     ";  text = "rofi -version | awk 'NR==1{print \"Rofi\", $2}'"; }
        { type = "terminal"; key = "  Terminal     "; }
        { type = "command";  key = "  Editor       ";  text = "nvim --version | awk 'NR==1{sub(/NVIM /,\"\"); print \"NvChad (Neovim \" $0 \")\"}'"; }
        { type = "command";  key = "  Files        ";  text = "yazi --version"; }
        { type = "command";  key = "  Browser      ";  text = "brave --version"; }
        { type = "command";  key = "  Notes        ";  text = "echo Obsidian"; }

        { type = "custom";   format = "── Themes ────────────────────"; }
        { type = "command";  key = "  Theme        ";  text = "echo Gruvbox Dark (AMOLED)"; }
        { type = "command";  key = "  Icons        ";  text = "echo Gruvbox-Plus-Dark"; }
        { type = "command";  key = "  Terminal Font";  text = "echo JetBrainsMono Nerd Font Mono"; }
        { type = "cursor";   key = "  Cursor       "; }

        "break"
        "colors"
      ];
    };
  };
}
