{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.programs.git;
in {
  options.programs.git = {
    userName = mkOption {
      type = types.str;
      default = "Henry Rausch";
      description = "Git user name";
    };
    userEmail = mkOption {
      type = types.str;
      default = "44985923+hra42@users.noreply.github.com";
      description = "Git user email";
    };
    signingKey = mkOption {
      type = types.str;
      default = "~/.ssh/root";
      description = "SSH key for signing Git commits";
    };
  };

  config = mkIf (cfg.userName != "" && cfg.userEmail != "") {
    programs.git = {
      enable = true;
      config = {
        user = {
          name = cfg.userName;
          email = cfg.userEmail;
        };
        commit.gpgsign = true;
        gpg = {
          format = "ssh";
          ssh = {
            defaultKeyCommand = "ssh-add -L";
            allowedSignersFile = "~/.config/git/allowed_signers";
          };
        };
        user.signingkey = cfg.signingKey;
      };
    };

    system.activationScripts.gitAllowedSigners = ''
      mkdir -p ~/.config/git
      echo "${cfg.userEmail} ${cfg.signingKey}" > ~/.config/git/allowed_signers
    '';

    programs.ssh.extraConfig = ''
      Host github.com
        IdentityFile ${cfg.signingKey}
	User git
    '';
  };
}

