{ pkgs, unstable, system, ... }:


{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../../shared.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "prince";
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

          };
        };
      };
    };
  system.stateVersion = "23.11";
}
