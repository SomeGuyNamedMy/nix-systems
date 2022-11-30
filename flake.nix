{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { self, nixpkgs, ...}:
    let
      shared-modules = [
        ./configuration.nix
        ./boot.nix
        ./packages.nix
        ./virtualisation.nix
        ./general-hardware.nix
      ];
    in {
      nixosConfigurations.flex = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = shared-modules ++ [ ./flex-hardware.nix ];
      };
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = shared-modules ++ [ ./desktop-hardware.nix ];
      };
    }; 
}
