# My NixOS Dotfile

My dotfiles
```md
.
├── flake.nix               (My flake)
├── flakes                  
│   ├── default.nix         
│   ├── home-manager.nix    (Home Manager Flakes)
│   └── nixos.nix           (NixOS Flakes)
├── hosts                   
│   ├── laptop              (Laptop imports)
│   └── pc                  (Pc imports)
└── modules
    ├── system              (System level configs)
    └── user                (User level configs)
```