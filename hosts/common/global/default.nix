{ inputs, outputs, ... }: {
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

  #home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  #networking.domain = "s5.com";

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