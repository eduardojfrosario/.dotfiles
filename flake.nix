{
  inputs = {
    nixpkgs.url  = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url   = "github:danth/stylix";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    disko.url = "github:nix-community/disko";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, disko, nvf, ... }@inputs:
    let
      system = "x86_64-linux";
      sharedModules = [ inputs.nvf.homeManagerModules.default ];
    in {
      nixosConfigurations =  {
        alpha = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/alpha
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs    = true;
              home-manager.useUserPackages  = true;
              home-manager.users.losg        = import ./home/hosts/alpha;
              home-manager.extraSpecialArgs = { inherit inputs sharedModules; };
            }
            home-manager.sharedModules [
              inputs.nvf.homeManagerModules.default
            ]
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
