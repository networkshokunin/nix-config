{pkgs, libs, inputs, outputs, ...}:
{
    nixpkgs.overlays = [
      outputs.overlays.unstable-packages
      (final: prev: {
        eza = final.unstable.callPackage inputs.eza { };
      })
  ];
}