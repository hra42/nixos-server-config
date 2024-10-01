{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    docker
    btop
    nano
    git
    ffmpeg_7-full
  ];
}
