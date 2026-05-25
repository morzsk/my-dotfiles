{ inputs, ... }:

let
  constants = import ../constants.nix;
in
{
  flake.nixosConfigurations = {
    pc = inputs.nixpkgs.lib.nixosSystem {
      system = constants.system;
      specialArgs = { inherit inputs constants; };
      modules = [
        inputs.stylix.nixosModules.stylix
        (constants.paths.hosts + "/pc/hardware.nix")
        (constants.paths.hosts + "/pc/system.nix")
      ];
    };

    laptop = inputs.nixpkgs.lib.nixosSystem {
      system = constants.system;
      specialArgs = { inherit inputs constants; };
      modules = [
        inputs.stylix.nixosModules.stylix
        (constants.paths.hosts + "/laptop/hardware.nix")
        (constants.paths.hosts + "/laptop/system.nix")
      ];
    };
  };
}
