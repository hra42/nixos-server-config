{ config, pkgs, ... }: {
  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAMobklx/54LmPfShdVrDFUo+Aopgs6GD3QA4I6Pkbln"
      ];
    };

    podmanuser = {
      isNormalUser = true;
      extraGroups = [ "podman" ];
    };

    nixos = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "podman" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII83A2cz5p2Sm50A3qJYz+/hTJGHUOmxhAcPDars6KvR"
      ];
    };
  };

  security.sudo = {
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ "nixos" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
