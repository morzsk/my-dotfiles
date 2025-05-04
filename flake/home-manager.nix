{ inputs, ... }:

let settings = import ../settings.nix; in
{
  flake.homeConfigurations = {
    alpha = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
		  # cudaSupport = true;
        };
      };
      extraSpecialArgs = { inherit settings; };
      modules = [
        ../imports/hosts/pc/user.nix
        inputs.nixvim.homeManagerModules.nixvim
        inputs.stylix.homeManagerModules.stylix
      ];
    };

    beta = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
      };
      extraSpecialArgs = { inherit settings; };
      modules = [
        ../imports/hosts/laptop/user.nix
		inputs.hyprland.homeManagerModules.hyprland
        inputs.nixvim.homeManagerModules.nixvim
        inputs.stylix.homeManagerModules.stylix
      ];
      useUserPackages = true;
    };
  };
}
