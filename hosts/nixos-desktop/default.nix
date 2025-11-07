{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];
  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
}
