{ inputs, ... }:

let
  hosts = inputs.self + "/hosts";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations = {
    pc = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        inputs.stylix.nixosModules.stylix
        (hosts + "/pc/hardware.nix")
        (hosts + "/pc/system.nix")
      ];
    };

    laptop = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      # specialArgs = { inherit inputs; };
      modules = [
        inputs.stylix.nixosModules.stylix
        (hosts + "/laptop/hardware.nix")
        (hosts + "/laptop/system.nix")
      ];
    };
  };
}
