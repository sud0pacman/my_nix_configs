{
  description = "NixOS configuration";
 
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # home manager, foydalanuvchi sozlamari boshqarish uchun ishlatiladi
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # inputsdagi `follows` kaliti moslab olish uchun ishlatiladi.
      # home manager ning `inputs.nixpkgs` si ushbu fleykning `inputs.nixpkgs`
      # si bilan bir xil tarzda olib boriladi har xil bo'lgandagi muammolarni
      # bartaraf etish uchun.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {  # <-- Yangi input: NixVim uchun
      url = "github:nix-community/nixvim/nixos-25.05";  # 25.05 ga mos
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 
  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      # ESLATMA iltimos hostname `my-nixos` ni o'zingiznikiga moslang
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          
          # home manager ni nixos moduli qilib yuklang
          # shunda home manager sozlamalari avtomatik tarzda qo'shilib ketadi `nixos-rebuild` ishga tushurilganda
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            # ESLATMA ryan ni o'zingizni foydalanuvchi otingizga almashtiring
            home-manager.users.muhammad = import ./home.nix;
            
            # Qo'shimchasiga home-manager.extraSpecialArgs ni home.nix ga argument oshirish uchun ishlatsangiz bo'ladi
	    home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
