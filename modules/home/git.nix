{...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "sud0pacman";
      user.email = "mukhammad.kammoliddin@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        http.sslVerify = false;
        pull.rebase = false;

        safe.directory = [
          "/home/bahrom/workplace/sud0pacman/nix-config"
          # Add other safe directories here if needed
        ];
      };
    };

    signing = {
      signByDefault = true;
      key = "6B6DB2AD85328F7F60C90EE7048B06C0FCE32C10";
    };

    # Git ignores
    ignores = [
      ".idea"
      ".DS_Store"
      "nohup.out"
      "node_modules"
      "result"
      ".direnv"
    ];
  };
}
