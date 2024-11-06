{ pkgs, lib, unstable, inputs, system, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver = {
    layout = "za";
    xkbVariant = "";
  };
  services.flatpak.enable = true;
  services.printing.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.libvirtd.enable = true; 
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire =
    {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  networking = {
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
        { from = 8091; to = 8096; } # KDE Connect
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
        { from = 8091; to = 8096; }       ];
    };
  };
  ##Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.xpadneo.enable = true;
  ##Bluetooth

  programs.dconf.enable = true;
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
  ];

  home-manager.users.prince =
    { system, ... }:
    let
      upkgs = with unstable; [
        #######Programming##########
        (dyalog.override { acceptLicense = true; })
        #######Programming##########
        ## GUI
        hyprland
        ride
        vscode
        zed-editor
      ];
    in
    {
      home = {
        packages = with pkgs;[
          #######Programming##########
          ##Java
          #zulu
          ##Java
          #######Programming##########

          ###GUI### 
          wezterm
          #########
        ] ++ upkgs;
      };

    };

}
