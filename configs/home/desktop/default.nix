{ pkgs, unstable, system, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../shared-desktop.nix
    ../../shared.nix
  ];

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
        stateVersion = "23.11";
      };

      ### Installed Settings####
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
            pull.rebase = true;
          };
        };
      };
      ################
    };
  ###Settings####
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  ###Settings####

  ###Services####
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "prince";
  };
  ##############
  system.stateVersion = "23.11";
}
