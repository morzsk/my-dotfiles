{ inputs, ... }:

let
    hosts = "${inputs.self}/hosts";
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.nix-vscode-extensions.overlays.default ];
        config = {
            allowUnfree = true;
        };
    };
in
{
    flake.homeConfigurations = {
        hyprpc = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
                inputs.stylix.homeModules.stylix
                "${hosts}/pc/user.nix"
            ];
        };

        hyprtop = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
                inputs.stylix.homeModules.stylix
                "${hosts}/laptop/user.nix"
            ];

            # useUserPackages = true;
        };
    };
}
