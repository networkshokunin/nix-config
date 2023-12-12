{ pkgs, lib, config, ... }:
{
  users.mutableUsers = false;
  users.users = {
    oscar = {
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ7X82I2M5GWwCnXugSceeFn4sSUexcoth4aRkZLyzkz"
      ];
      passwordFile = config.sops.secrets.oscar-password.path;
      #mkpasswd -m sha-512
      extraGroups = ["wheel"];

    };
  };

  sops.secrets.oscar-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };
  
}
