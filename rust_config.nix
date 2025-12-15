# rust_config.nix
{pkgs}:
pkgs.mkShell {
  buildInputs = [
    pkgs.rust-bin.stable.latest.default
    pkgs.rust-analyzer
    pkgs.cargo
    pkgs.clang
    pkgs.openssl
  ];

  shellHook = ''
    echo "Welcome to Rust devShell! 🦀"
    echo "Rust version: $(rustc --version)"
    echo "Cargo version: $(cargo --version)"
  '';
}
