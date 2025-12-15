Test build
```
nix build .#nixosConfigurations.nixos.config.system.build.toplevel --show-trace
```

Format
```
alejandra .
```