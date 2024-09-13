{ config, pkgs, ... }: {
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  time.timeZone = "Europe/Berlin";  # Adjust to your time zone
  i18n.defaultLocale = "de_DE.UTF-8";

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.tmp.cleanOnBoot = true;

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };
}
