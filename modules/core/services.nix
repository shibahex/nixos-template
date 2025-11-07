{profile, ...}: {
  # Services to start
  services = {
    fstrim.enable = true; # SSD Optimizer
    openssh.enable = true; # Enable SSH

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;  # Enable WirePlumber session manager
    };
  };


}
