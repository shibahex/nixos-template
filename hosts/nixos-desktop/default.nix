{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
