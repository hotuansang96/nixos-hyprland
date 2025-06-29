{
  description = "NixOS with Hyprland & Catppuccin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.sanght = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/sanght/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanght = import ./home/sanght/home.nix;
          }
          catppuccin.nixosModules.catppuccin
        ];
      };
    };
}
