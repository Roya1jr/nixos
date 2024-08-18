{ inputs, pkgs, unstable, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared-desktop.nix
    ../../shared.nix
  ];

  home-manager.users.prince =
    { pkgs, unstable, inputs, system, ... }:
    let
      upkgs = with unstable; [

      ];
    in
    {
      home = {
        packages = with pkgs;[


        ] ++ upkgs;
      };

      ###Services####
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        user = "prince";
      };
      ##############

      ###Settings####
      programs = {
        git = {
          enable = true;
          userName = "Prince Junior Mguni";
          userEmail = "prince.mguni@outlook.com";
          extraConfig = {
            init = {
              defaultBranch = "main";
            };
            safe = {
              directory = "/etc/nixos";
            };
          };
        };
        steam = {
          enable = true;
          remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        };
      };
     ################
    };
  system.stateVersion = "23.11";
}
