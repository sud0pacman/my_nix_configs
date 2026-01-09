{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  hashedPassword = "$y$j9T$RxLtWEhvSkRE/8Vp4G5TG/$Yy5wbbP/xVIzNxpxd1c1psDEgHcMAwHp2PPyNWF.yq7";
in {
  config = {
    users.users = {
      muhammad = {
        inherit hashedPassword;
        isNormalUser = true;
        description = "Muhammad";
        shell = pkgs.zsh;

        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "vboxusers"
          "media"
          "admins"
          "libvirtd"
          "input"
        ];

        openssh.authorizedKeys.keys = [
          # dll
          # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDH+EVAeaZpe98gggH8fPQ4bKEgw2FbTqYzngTRSpSbp magdiyevbahrom04@gmail.com"
          # # mtx
          # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFEJjeEUMVe4fyRXVGbG4UvQiSACjPv/AEdyytIazfgT magdiyevbahrom@gmail.com"
          # add more
        ];
      };
    };

    home-manager = {
      backupFileExtension = "hbak";
      extraSpecialArgs = {
        inherit inputs outputs;
      };
      users = {
        # Import your home-manager configuration
        muhammad = import ../../hosts/matax/home.nix;
      };
    };
  };
}
