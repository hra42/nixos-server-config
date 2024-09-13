{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./modules/base.nix
    ./modules/users.nix
    ./modules/ssh.nix
    ./modules/podman.nix
    ./modules/packages.nix
    ./modules/packages.nix
  ];
}
