{ ... }: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "NixOS-Test";
  networking.domain = "";

  system.stateVersion = "23.11";
}
