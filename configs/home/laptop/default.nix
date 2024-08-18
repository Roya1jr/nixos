{ inputs, pkgs, unstable, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix
    ../../shared-desktop.nix
    ../../shared.nix
  ];
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    git = {
      enable = true;
      userName = "Prince Junior Mguni";
      userEmail = "princem@bestforu.co.za";
      ignores = [ "*node_modules" ];
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        safe = {
          directory = "/etc/nixos";
        };

      };
    };
  };
  home-manager.users.prince =
    { ... }:
    let
      upkgs = with unstable; [

      ];
    in
    {
      home = {
        packages = with pkgs;[


        ] ++ upkgs;
      };

    };
}
