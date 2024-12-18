{
  description = "My flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
    };
    stylix.url = "github:danth/stylix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
      flake-parts.url = "github:hercules-ci/flake-parts";
    };

  outputs = { self, nixpkgs, home-manager, hyprland, nixvim, stylix, nix-minecraft, nix-flatpak, flake-parts, ... } @ inputs:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = nixpkgs.lib.systems.flakeExposed;
    imports = [ ./flake ];
  };
}
