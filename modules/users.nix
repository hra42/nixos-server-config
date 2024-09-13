{ ... }: {
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAMobklx/54LmPfShdVrDFUo+Aopgs6GD3QA4I6Pkbln"
  ];

  users.users.podmanuser = {
    isNormalUser = true;
    extraGroups = [ "podman" ];
    # Add any other user configuration you need
  };
}
