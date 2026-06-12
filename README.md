# My NixOS Dotfile

My dotfiles
```md
.
├── flake.nix               (My flake)
├── flakes                  
│   ├── default.nix         
│   ├── home-manager.nix    (Home Manager Flakes)
│   └── nixos.nix           (NixOS Flakes)
├── hosts                   
│   ├── laptop              (Laptop imports)
│   └── pc                  (Pc imports)
└── modules
    ├── system              (System level configs)
    └── user                (User level configs)
```

My Setup
```md
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             ── System ────────────────────
          ▜███▙       ▜███▙  ▟███▛               OS             NixOS 26.11 (Zokor) + Home-Manager
           ▜███▙       ▜███▙▟███▛                WM             Hyprland 0.55.2 (Wayland)
            ▜███▙       ▜██████▛                 Shell          zsh 5.9.1
     ▟█████████████████▙ ▜████▛     ▟▙           Fetch          fastfetch 2.63.1 (x86_64)
    ▟███████████████████▙ ▜███▙    ▟██▙        ── Apps ──────────────────────
           ▄▄▄▄▖           ▜███▙  ▟███▛          Launcher       Rofi 2.0.0
          ▟███▛             ▜██▛ ▟███▛           Terminal       kitty 0.47.1
         ▟███▛               ▜▛ ▟███▛            Editor         NvChad (Neovim v0.12.2)
▟███████████▛                  ▟██████████▙      Files          Yazi 26.5.6 (Nixpkgs 2026-05-05)
▜██████████▛                  ▟███████████▛      Browser        Brave Browser 148.1.90.128
      ▟███▛ ▟▙               ▟███▛               Notes          Obsidian
     ▟███▛ ▟██▙             ▟███▛              ── Themes ────────────────────
    ▟███▛  ▜███▙           ▝▀▀▀▀                 Icons          Gruvbox-Plus-Dark
    ▜██▛    ▜███▙ ▜██████████████████▛           Terminal Font  JetBrainsMono Nerd Font Mono
     ▜▛     ▟████▙ ▜████████████████▛            Cursor         Capitaine Cursors (Gruvbox) (20px)
           ▟██████▙         ▜███▙
          ▟███▛▜███▙         ▜███▙                                     
         ▟███▛  ▜███▙         ▜███▙                                    
         ▝▀▀▀    ▀▀▀▀▘         ▀▀▀▘
```
