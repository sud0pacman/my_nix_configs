{
  pkgs,
  inputs,
  config,
  ...
}: let
  xinux-wallpapers = pkgs.lib.recurseIntoAttrs (pkgs.callPackage ./wallpapers.nix {});
  alejandra = inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system};
in {
  config = {
    programs.nix-ld.enable = true;

    environment = {
      variables = {
        EDITOR = "nvim";
      };
      systemPackages = with pkgs; [
        # fonts
        freefont_ttf
        #formatter
        alejandra
        nixfmt-rfc-style

        pkgs.desktop-file-utils
        neovim
        vim
        fastfetch
        xorg.xkbcomp
        rng-tools
        haveged
        xorg.setxkbmap
        pkgs.flatpak-builder
        woeusb # for creating windows usb

        # git/hub
        age
        sops
        pinentry-gnome3

        # l10n
        hunspell
        hunspellDicts.uz_UZ
        # Services
        # redis
        #
        # xinux-wallpapers
        xinux-wallpapers.xinux-blue-light
        xinux-wallpapers.xinux-blue-dark
        xinux-wallpapers.xinux-orange

        anydesk
      ];
    };
  };
}
