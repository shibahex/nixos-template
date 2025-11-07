{
  pkgs,
  lib,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  
  environment.systemPackages = with pkgs; [
    librewolf
    # packages here
  ];
}
