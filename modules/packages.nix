{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    podman-compose
    btop
    nano
    git
  ];
}
