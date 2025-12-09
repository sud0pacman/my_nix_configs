{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Neovim uchun kerak bo'ladigan system level packagelar
    extraPackages = with pkgs; [
      nodejs
      python3
      ripgrep
      fd
      gcc
    ];
  };

  # Neovim config fayllari
  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
}

