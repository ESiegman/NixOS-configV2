# Hardware/nvidia.nix

{ config, ... }:

{
  # Setup NVIDIA Graphics
  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      # Mode Setting Required
      modesetting.enable = true;
      # NVIDIA Power Management
      powerManagement = {
        enable = true; 
        finegrained = true; # Turns off GPU when not in use
      };

      # Open Source NVIDIA Driver
      open = false;

      # Enable NVIDIA Settings menu
      nvidiaSettings = true;

      # Choose NVIDIA Driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # Enable NVIDIA Prime
      prime = {
        # NVIDIA Prime Offload
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    # Enable NVIDIA for Docker
    nvidia-container-toolkit.enable = true;
  };

  boot = {
    initrd.kernelModules = [ "nvidia" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
