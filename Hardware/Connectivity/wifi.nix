# Hardware/Connectivity/wifi.nix

{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    #firewall = {
    #  enable = true;
    #  allowedTCPPorts = [ 22 80 443 ];
    #  allowedUDPPorts = [ 53 ];
    #};
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
  programs.nm-applet.enable = true;
}
