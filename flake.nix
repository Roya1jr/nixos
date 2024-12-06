{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # bqnlsp = {
    #   url = "sourcehut:/~detegr/bqnlsp";
    #   flake = true;
    # };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    in

    {
      nixosConfigurations =
        let
          mkSystem =
            entrypoint:
            nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit inputs;
                inherit unstable;
                inherit pkgs;
              };
              modules = [
                entrypoint
                { nix.registry.nixpkgs.flake = nixpkgs; }
                home-manager.nixosModules.home-manager
                {
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                  };
                }
              ];
            };
        in
        {
          desktop = mkSystem ./configs/home/desktop;
          laptop = mkSystem ./configs/home/laptop;
          wsl = mkSystem ./configs/home/wsl;
        };
    };
}
