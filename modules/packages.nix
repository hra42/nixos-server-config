{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    docker
    btop
    nano
    git
  ];
}
