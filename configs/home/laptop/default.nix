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
          userEmail = "princem@bestforu.co.za";
          ignores = [ "*node_modules" ];
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
  programs = { };
  ###Settings####

  ###Services####
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  ##############

  system.stateVersion = "23.11";
}
