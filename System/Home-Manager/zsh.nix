# System/Home-Manager/zsh.nix

{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;
      autocd = true;
      dotDir = ".config/zsh";

      shellAliases = {
        grep = "grep --color=auto";
        teams = "teams-for-linux --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --no-sandbox --disable-gpu";
        discord = "rm -rf /home/eren/.config/Vencord/themes; discord --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --no-sandbox --disable-gpu";
        modman = "r2modman --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --no-sandbox --disable-gpu";
        cat = "bat";
        buildsys = "sudo nixos-rebuild switch --flake .#nixos --impure";
        fastfetch = "fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21";
        matlab = "nvidia matlab";
        latex = "latexmk -pdf -f";
        chrome = "nix-shell -p chromium --run 'chromium --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --disable-gpu'";
        obsidian = "obsidian --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto --disable-gpu";
      };
      initExtraFirst = ''
        export XDG_DATA_HOME="$HOME/.local/share"
        mkdir -p ~/.local/share/applications
        sed 's/^Exec=/&nvidia-offload /' /run/current-system/sw/share/applications/steam.desktop > ~/.local/share/applications/steam.desktop
        eval $(thefuck --alias)
      '';
      initExtra = ''
        source ~/.p10k.zsh
        # Function to connect/disconnect to VPN
        function vpn {
          if sudo wg show wgnord 2>/dev/null | grep -q 'interface: wgnord'; then
            echo "You are currently connected to VPN."
            read -p "Do you want to disconnect? (y/n): " choice
            if [[ $choice == "y" ]]; then
              sudo wgnord d
              fi
            else
              echo "You are currently not connected to VPN."
              read -p "Do you want to connect? (y/n): " choice
            if [[ $choice == "y" ]]; then
              read -p "Enter the location to connect: " location
              sudo wgnord c $location
            fi
          fi
        }

        # Functions to run MATLAB 
        function run-matlab-file {
          if [ -z "$1" ]; then
            echo "Please provide the MATLAB script file (.m) to run."
            return 1
          fi
                    
          local directory=$(pwd)
          local script_file="$1"
          local location="$directory/$script_file"
                
          cp "$location" ~/MATLAB
          nvidia matlab -nosplash -nodesktop -r "run('$script_file');"
        }
        function run-matlab-cli {
          nvidia matlab -nodisplay -nosplash -nodesktop
        }

        # Function to setup and/or enter virtual Python environment
        function virt_env {
          if [[ -n "$VIRTUAL_ENV" ]]; then
            deactivate
          else
            if [ ! -d "./venv" ]; then
              python -m venv venv
            fi
            source ./venv/bin/activate
          fi
        }

        # Function to offload to NVIDIA GPU
        function nvidia {
          export __NV_PRIME_RENDER_OFFLOAD=1
          export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
          export __GLX_VENDOR_LIBRARY_NAME=nvidia
          export __VK_LAYER_NV_optimus=NVIDIA_only
          DRI_PRIME=1 "$@"
        }

        fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
        ];
      };
      plugins = [
        {name = "powerlevel10k";src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
      ];
    };
  };
}
