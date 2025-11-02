{ inputs, ... }:

let
    hosts = "${inputs.self}/hosts";
    system = "x86_64-linux";
in 
{
    flake.nixosConfigurations = {
        pc = inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                "${hosts}/pc/hardware.nix"
                "${hosts}/pc/system.nix"
                inputs.stylix.nixosModules.stylix
            ];
       };

        laptop = inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                "${hosts}/laptop/hardware.nix" 
				"${hosts}/laptop/system.nix"
                inputs.stylix.nixosModules.stylix
            ];
        };
    };
}
