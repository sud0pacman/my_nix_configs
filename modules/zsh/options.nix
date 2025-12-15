{ config, pkgs, ... }:

{
  programs.zsh.initExtra = ''
    setopt autocd
    setopt correct
    setopt interactivecomments
    setopt nomatch

    bindkey -e
  '';
}

