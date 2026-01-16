{inputs, ...}: {
  imports = with inputs.self; [
    homeModules.direnv
    homeModules.nixpkgs
    homeModules.home.git
    homeModules.home.zsh
    homeModules.home.zed
    homeModules.home.ssh
    homeModules.home.fish
    homeModules.home.vscode
    homeModules.home.starship
    homeModules.home.packages
    homeModules.home.fastfetch
    homeModules.home.gnome
    homeModules.home.astronvim
  ];

  # home.keyboard = null;
  home = {
    username = "muhammad";
    homeDirectory = "/home/muhammad";

    keyboard = {
      layout = "uz";
      variant = "latin";
    };
  };

  programs.home-manager.enable = true;
}
