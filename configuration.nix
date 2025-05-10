# configuration.nix

{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./Hardware/audio.nix
    ./Hardware/nvidia.nix
    ./Hardware/Connectivity/bluetooth.nix
    ./Hardware/Connectivity/wifi.nix
    ./System/Interface/display.nix
    ./System/Interface/services.nix
    ./System/Programs/NixVim/nixvim.nix
    ./System/Programs/applications.nix
    ./System/Programs/devtools.nix
    ./System/Programs/games.nix
    ./System/Programs/docker.nix
    ./System/Programs/spicetify.nix
    ./System/Theme/stylix-wallpaper.nix
    ./System/Theme/stylix.nix
    ./System/Users/user.nix
  ];

  # Allocate swap memory space
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 48 * 1024; # 48 GiB
  }];

  # Enable Home Manager for user configuration
  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      eren = import ./System/Home-Manager/home.nix;
    };
  };

  # Allow proprietary software
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
    permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.configurationLimit = 10;

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="09db", ATTR{idProduct}=="00c6", MODE="0666"
  '';

  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
