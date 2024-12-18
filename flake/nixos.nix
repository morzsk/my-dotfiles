{ inputs, ... }:

{
  flake.nixosConfigurations = {
    # PC Configuration
    pc = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      	({ pkgs, ... }: { networking.hostName = "pc"; })
        ../imports/hosts/pc/system.nix
        inputs.stylix.nixosModules.stylix
        inputs.nix-minecraft.nixosModules.minecraft-servers
      ];
    };

    # Laptop Configuration
    laptop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      	({ pkgs, ... }: { networking.hostName = "laptop"; })
        ../imports/hosts/laptop/system.nix
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
} 
