# configuration.nix

{ inputs, ... }:

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
    ./System/Theme/stylix-wallpaper.nix
    ./System/Theme/stylix.nix
    ./System/Users/user.nix
  ];

  # Allocate swap memory space
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 16 GiB
  }];

  # Enable Home Manager for user configuration
  home-manager = {
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
  };

  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
