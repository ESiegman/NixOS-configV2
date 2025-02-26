# System/Users/user.nix

{ pkgs, ... }:

{
  users.users = {
    eren = {
      initialPassword = "password"; # Initial password for the user
      isNormalUser = true;
      home = "/home/eren";
      description = "Primary User";
      openssh.authorizedKeys.keys = [
        # TODO: Add public key here
      ];
      extraGroups = [
        # List of extra groups to add the user to
        "wheel"
        "networkmanager"
        "audio"
        "video"
        "docker"
        "plugdev"
        "lp"
        "scanner"
        "input"
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true; # Ignore the check since Zsh is managed by Home Manager
    };
  };

  security.sudo.extraRules = [
    {
      users = [ "eren" ];
      commands = [
        { command = "/run/current-system/sw/bin/nixos-rebuild"; options = [ "NOPASSWD" ]; }
        { command = "/usr/bin/sed"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}
