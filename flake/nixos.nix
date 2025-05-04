{ inputs, ... }:

let settings = import ../settings.nix; in
{
  flake.nixosConfigurations = {
    # PC Configuration
    pc = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit settings; };
      modules = [
      	({ pkgs, ... }: { networking.hostName = "pc"; })
        ../imports/hosts/pc/system.nix
        inputs.stylix.nixosModules.stylix
      ];
    };

    # Laptop Configuration
    laptop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit settings; };
      modules = [
      	({ pkgs, ... }: { networking.hostName = "laptop"; })
        ../imports/hosts/laptop/system.nix
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
} 
