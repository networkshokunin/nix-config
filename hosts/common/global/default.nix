{ inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./lldpd.nix
    ./jetbrains-mono.nix
    ./locale.nix
    ./openssh.nix
    ./packages.nix
    ./users.nix
    ./zfs.nix
    ./zsh.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  #networking.domain = "s5.com";

  environment.loginShellInit = ''                                                                                                    
   # disable for user root and non-interactive tools                                                                                
   if [ `id -u` != 0 ]; then                                                                                                        
     if [ "x''${SSH_TTY}" != "x" ]; then                                                                                            
       ${pkgs.neofetch}/bin/neofetch                                                                                                         
     fi                                                                                                                             
   fi                                                                                                                               
  '';

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
  #garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "03:15";  