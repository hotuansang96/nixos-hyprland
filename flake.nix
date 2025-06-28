{
  description = "NixOS with Hyprland & Catppuccin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }@inputs: {
    nixosConfigurations.macvm = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/macvm.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.sanght = import ./home/sanght.nix;
        }
      ];
    };
  };
}

