{
  # Git Configuration
  gitUsername = "shiba";
  gitEmail = "shiba@nixos-desktop";

  # For Nvidia Prime support
  # Run 'lspci | grep VGA' to find your actual GPU IDs
  intelID = "PCI:0:2:0"; # Update with your integrated GPU ID
  nvidiaID = "PCI:1:0:0"; # Update with your NVIDIA GPU ID

  # Startup Applications
  startupApps = [
  ];
}
