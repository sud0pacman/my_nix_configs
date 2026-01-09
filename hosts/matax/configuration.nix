{
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    # configs for module manager
    ./modules.nix
    # options for module manager
    ../../nixos/xinux/default.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-data.nixosModules.nix-data
    inputs.self.homeModules.nixpkgs
    inputs.self.homeModules.desktop
    inputs.self.homeModules.keyboard
    inputs.self.homeModules.users.muhammad
  ];

  networking.hostName = "muhammad";

  # remove all gnome utility apps
  # services.gnome.core-utilities.enable = false;

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.11";
  environment.systemPackages = [
    pkgs.sqlitebrowser
    pkgs.boltbrowser
    pkgs.kstars
    pkgs.gnome-solanum
    pkgs.nextcloud-client
    pkgs.icon-library
    pkgs.calamares-nixos
    pkgs.gnome-podcasts
    pkgs.cambalache
    pkgs.adwsteamgtk
    pkgs.bustle
    pkgs.firefox
    pkgs.gradia
  ];
}
