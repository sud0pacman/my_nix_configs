{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    ll = "ls -lah";
    gs = "git status";
    ga = "git add .";
    gc = "git commit";
    gco = "git checkout";
    rebuild = "sudo nixos-rebuild switch";
  };
}

