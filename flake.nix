{
    description = "My nix configuration!";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        flake-parts.url = "github:hercules-ci/flake-parts";

        hyprland.url = "github:hyprwm/Hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        hyprfocus = {
          url = "github:daxisunder/hyprfocus";
          inputs.nixpkgs.follows = "hyprland";
        };

        nix-vscode-extensions = {
            url = "github:nix-community/nix-vscode-extensions";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        swww.url = "github:LGFae/swww";
        stylix.url = "github:danth/stylix";
    };
    
    outputs = {
        self,
        nixpkgs,
        flake-parts,
        ...
    } @ inputs:

    flake-parts.lib.mkFlake { inherit inputs; } {
        systems = nixpkgs.lib.systems.flakeExposed;
        imports = [ ./flakes ];
    };
}
