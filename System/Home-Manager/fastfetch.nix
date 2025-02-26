# System/Home-Manager/fastfetch.nix

{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "nixos";
        color = {
          "1" = "white";
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        {
          type = "kernel";
          key = "  NixOS   ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "┌──────────────────────────Software──────────────────────────┐";
        }
        {
          type = "shell";
          key = "  Shell   ";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = "  Terminal";
          keyColor = "green";
        }
        {
          type = "terminalfont";
          key = "  Font    ";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "  Packages";
          keyColor = "green";
        }
        {
          type = "de";
          key = " 󰍹 DE      ";
          keyColor = "green";
        }
        {
          type = "wm";
          key = " 󰧨 WM      ";
          keyColor = "green";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────────────┘";
        }
        {
          type = "custom";
          format = "┌───────────────────────────Hardware─────────────────────────┐";
        }
        {
          type = "display";
          key = "  Display ";
          keyColor = "cyan";
        }
        {
          type = "cpu";
          key = "  CPU     ";
          keyColor = "cyan";
        }
        {
          type = "gpu";
          key = "  GPU     ";
          keyColor = "cyan";
        }
        {
          type = "memory";
          key = "  RAM     ";
          keyColor = "cyan";
        }
        {
          type = "disk";
          key = "  Disk    ";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 15;
        }
      ];
    }; 
  };
}
