# System/Home-Manager/git.nix

{ ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "Eren";
      userEmail = "jimrobot42@outlook.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
    gitui = {
      enable = true;
    };
  };
}
