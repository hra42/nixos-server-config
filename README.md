# NixOS Server Configuration

This repository contains the NixOS configuration for my server setup. It uses a modular approach to organize different aspects of the system configuration.

## Structure

- `configuration.nix`: Main configuration file that imports all modules
- `modules/`: Directory containing modular configuration files
  - `base.nix`: Base system configuration
  - `docker.nix`: Docker container setup
  - `git.nix`: Git configuration and commit signing setup
  - `packages.nix`: System-wide package installations
  - `ssh.nix`: SSH server configuration
  - `system.nix`: General system settings and auto-upgrade configuration
  - `users.nix`: User account configurations

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/hra42/nixos-server-config.git
   ```

2. Review and adjust the configuration files as needed.

3. Apply the configuration:
   ```
   sudo nixos-rebuild switch
   ```

## Key Features

- Modular configuration for easy management
- Secure SSH setup with custom port (22222)
- Docker for containerization
- Custom user configurations with SSH key authentication
- Git configuration with commit signing using SSH keys
- Comprehensive package management
- Automatic system upgrades and garbage collection

## Customization

To customize this configuration for your own use:

1. Update `users.nix` with your own user accounts and SSH keys
2. Modify `packages.nix` to include the software you need
3. Adjust `git.nix` with your own Git user name, email, and signing key
4. Review and modify other module files as necessary for your specific requirements

## Maintenance

The system is configured for automatic maintenance:

- Automatic upgrades are enabled (see `system.nix`)
- Garbage collection runs weekly, removing generations older than 30 days
- The Nix store is automatically optimized

To manually update your NixOS system and this configuration:

1. Pull the latest changes from this repo
2. Run `sudo nixos-rebuild switch` to apply updates

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is released into the public domain - see the LICENSE.md file for details.
