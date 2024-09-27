# NixOS Server Configuration

This repository contains the NixOS configuration for my server setup. It uses a modular approach to organize different aspects of the system configuration.

## Structure

- `configuration.nix`: Main configuration file that imports all modules
- `modules/`: Directory containing modular configuration files
  - `git.nix`: Git configuration
  - `monitoring.nix`: System monitoring setup
  - `networking.nix`: Network configuration
  - `packages.nix`: System-wide package installations
  - `podman.nix`: Podman container setup
  - `security.nix`: Security-related configurations
  - `ssh.nix`: SSH server configuration
  - `system.nix`: General system settings
  - `users.nix`: User account configurations

## Usage

1. Clone this repository:
git clone https://github.com/hra42/nixos-server-config.git

2. Review and adjust the configuration files as needed.

3. Deploy the configuration:
sudo ./deploy.sh

## Key Features

- Modular configuration for easy management
- Secure SSH setup
- Podman for containerization
- Custom user configurations including admin user
- Git configuration with commit signing

## Customization

To customize this configuration for your own use:

1. Update `users.nix` with your own user accounts and SSH keys
2. Modify `packages.nix` to include the software you need
3. Adjust other module files as necessary for your specific requirements

## Maintenance

Remember to regularly update your NixOS system and this configuration:

1. Pull the latest changes from this repo
2. Run `sudo nixos-rebuild switch` to apply updates
