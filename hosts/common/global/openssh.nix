{ outputs, lib, config, ... }:

let
  inherit (config.networking) hostName;
  #hosts = outputs.nixosConfigurations;
  pubKey = host: ../../${host}/ssh_host_ed25519_key.pub;
  
  # Sops needs acess to the keys before the persist dirs are even mounted; so
  # just persisting the keys won't work, we must point at /persist
  # hasOptinPersistence = config.environment.persistence ? "/persist";
in
{
  services.openssh = {
      enable = true;
      settings = {
        permitRootLogin = "no";
        StreamLocalBindUnlink = "yes";
        passwordAuthentication = false;
      };  

      hostKeys = [
      {
          path = "/persist/ssh/ssh_host_ed25519_key";
          type = "ed25519";
      }
      {
          path = "/persist/ssh/ssh_host_rsa_key";
          type = "rsa";
          bits = 4096;
      }
      ];

    };
  # Passwordless sudo when SSH'ing with keys
  security.pam.enableSSHAgentAuth = true;
}

#hostName: Pulls the hostname from the active network configuration (config.networking).
#pubKey: A function that gets the public part of the SSH host key for a certain host.
#hasOptinPersistence: Checks if there is a "persistence" option in the environment configurations (config.environment.persistence) If so, it returns '/persist', otherwise it returns null.