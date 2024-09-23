{ config, pkgs, ... }: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
      X11Forwarding = false;
      AllowAgentForwarding = false;
      AllowTcpForwarding = false;
      GatewayPorts = "no";
      ChallengeResponseAuthentication = false;
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
        "aes256-ctr"
        "aes192-ctr"
        "aes128-ctr"
      ];
      KexAlgorithms = [
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group-exchange-sha256"
      ];
      MaxAuthTries = 3;
      PermitEmptyPasswords = false;
      PermitUserEnvironment = false;
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
    };
    ports = [ 22222 ];
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22222, 80, 443 ];  # Allow only the SSH and HTTP(S) ports
  };
}
