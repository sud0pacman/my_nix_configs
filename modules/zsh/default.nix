{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };

    initExtra = ''
      # prompt oddiy bo‘lsin
      PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '
    '';
  };

  imports = [
    ./alias.nix
    ./options.nix
  ];
}
