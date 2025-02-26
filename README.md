# NixOS-configV2

This repository contains my personal NixOS configuration files.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/ESiegman/NixOS-configV2.git
   cd NixOS-configV2
   ```

2. Copy the configuration files to `/etc/nixos/`:
   ```sh
   sudo cp -r * /etc/nixos/
   ```

3. Rebuild and switch to the new configuration:
   ```sh
   sudo nixos-rebuild switch --flake .#nixos --impure
   ```

## Scripts

The `scripts/` folder contains various scripts that should be placed in your home directory (`~`). To move the scripts and set the executable permissions, run:
   ```sh
   cp -r scripts/* ~/
   chmod +x ~/scripts/*
   ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
