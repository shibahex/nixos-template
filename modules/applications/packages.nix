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
    neovim
    librewolf
    _1password-gui
    easyeffects
    pavucontrol
    # packages here
  ];
}
