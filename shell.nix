{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "my_nix_configs";

  nativeBuildInputs = with pkgs; [
    nixd
    statix
    deadnix
    alejandra
    age
    sops
    rng-tools
    openssl
  ];

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
