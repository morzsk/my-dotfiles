{
  description = "My flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, nixvim, stylix, flake-parts, ... } @ inputs:
  let settings = import ./settings.nix; in
  flake-parts.lib.mkFlake { inherit inputs; } {
	perSystem = { config, system, ... }: {
		_module.args.settings = settings;
	};
    systems = nixpkgs.lib.systems.flakeExposed;
    imports = [ ./flake	];
  };
}
