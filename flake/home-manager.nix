{ inputs, settings, ... }:

{
  flake.homeConfigurations = {
    mo-pc = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
		  # cudaSupport = true;
        };
      };
      modules = [
        ../imports/hosts/pc/user.nix
        inputs.nixvim.homeManagerModules.nixvim
        inputs.stylix.homeManagerModules.stylix
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    };

    mo-laptop = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
      };
      modules = [
        ../imports/hosts/laptop/user.nix
        inputs.nixvim.homeManagerModules.nixvim
        inputs.stylix.homeManagerModules.stylix
      ];
      useUserPackages = true;
    };
  };
}
