# System/Home-Manager/textfox.nix
{ inputs, ... }:

{
  imports = [ inputs.textfox.homeManagerModules.default ];
  textfox = {
      enable = true;
      profile = "eren";
      config = {
        background = {
          #color = "#000000";
        };
        border = {
          #color = "#555555";
          width = "4px";
          transition = "1.0s ease";
          radius = "3px";
        };
        tabs.horizontal.enable = false;
        displayWindowControls = false;
        displayNavButtons = false;
        displayUrlbarIcons = false;
        displaySidebarTools = false;
        displayTitles = true;
        newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
        font = { 
          family = "Fira Code";
          size = "15px";
          #accent = "#000000";
        };
        tabs.vertical.margin = "1.0rem";
      };
  };
}
