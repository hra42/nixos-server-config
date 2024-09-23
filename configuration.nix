{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./modules/base.nix
    ./modules/users.nix
    ./modules/ssh.nix
    ./modules/docker.nix
    ./modules/packages.nix
    ./modules/git.nix
  ];
}
