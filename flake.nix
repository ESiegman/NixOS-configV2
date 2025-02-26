# flake.nix
{
  description = "NixOS configuration for my personal computers";

  inputs = {
    # NixOS Unstable Package Channel
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # Home Manager Configuration Tool
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland Window Manager
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix Theme Engine
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    # NeoVim fork for Nix Configuration
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Matlab Compatibility Layer
    nix-matlab = {
      url = "gitlab:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Discord Fork for Nix Configuration
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Grub Theme
    nixos-grub-theme = {
      url = "github:jeslie0/nixos-grub-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # SDDM Theme
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.nix-matlab.overlay
          inputs.sddm-sugar-candy-nix.overlays.default
        ];
        # Allow installing proprietary software
        config = {
          allowUnfree = true;
        };
      };
    in 
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.nixvim.nixosModules.nixvim
          inputs.sddm-sugar-candy-nix.nixosModules.default
        ];
        specialArgs = { inherit inputs pkgs system; };
      };
    };
}
