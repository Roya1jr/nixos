{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bqnlsp ={ 
    url = "sourcehut:/~detegr/bqnlsp";
    flake = true;
    };
  };

  outputs = inputs@{ nixpkgs,nixpkgs-unstable, home-manager, ... }:  

let 
	system = "x86_64-linux";
	pkgs = import nixpkgs {inherit system;};
	unstable = import nixpkgs-unstable {inherit system;};
in

{
    nixosConfigurations = { 
      nixos = nixpkgs.lib.nixosSystem {
      inherit system; 
        modules = [
          ./configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.prince = import ./home.nix;
            home-manager.extraSpecialArgs = {
	               inherit unstable;
                 inherit inputs;
                 inherit system;
	         };
          
         }
        ];
      };
    };
  };
}
