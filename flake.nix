{
  description = "NixOS Template (credits to Don OS)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    # Helper function to create a host configuration
    mkHost = {
      hostname,
      profile,
      username,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          host = hostname;
          inherit profile;
          inherit username;
        };
        modules = [
	  ./hosts/${hostname}
          ./profiles/${profile}
          ./modules/applications
	  ./modules/core
	  ./modules/desktop
        ];
      };
  in {
    nixosConfigurations = {
      # Default template configuration
      # Users will create their own host configurations during installation
      default = mkHost {
        hostname = "default";
        profile = "amd";
        username = "user";
      };

      nixos-desktop = mkHost {
        hostname = "nixos-desktop";
        profile = "nvidia";
        username = "shiba";
      };
    };
  };
}
