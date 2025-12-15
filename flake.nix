{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # home manager, foydalanuvchi sozlamari boshqarish uchun ishlatiladi
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # inputsdagi `follows` kaliti moslab olish uchun ishlatiladi.
      # home manager ning `inputs.nixpkgs` si ushbu fleykning `inputs.nixpkgs`
      # si bilan bir xil tarzda olib boriladi har xil bo'lgandagi muammolarni
      # bartaraf etish uchun.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {nixpkgs, ...}: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    devShells."x86_64-linux".default = import ./shell.nix {inherit pkgs;};

    formatter.x86_64-linux = pkgs.alejandra;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];

      specialArgs = {
        inherit inputs;
      };
    };
  };
}
