{ inputs, ... }:

let
  constants = import ../constants.nix;
  pkgs = import inputs.nixpkgs {
    system = constants.system;
    overlays = [ 
      inputs.nix-vscode-extensions.overlays.default 
    ];
    config = {
      allowUnfree = true;
    };
  };
in
{
  flake.homeConfigurations = {
    hyprpc = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs constants; };
      modules = [
        inputs.stylix.homeModules.stylix
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        (constants.paths.hosts + "/pc/user.nix")
      ];
    };

    hyprtop = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs constants; };
      modules = [
        inputs.stylix.homeModules.stylix
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        (constants.paths.hosts + "/laptop/user.nix")
      ];
    };
  };
}