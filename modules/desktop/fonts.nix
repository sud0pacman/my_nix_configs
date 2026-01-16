{pkgs, ...}: {
  config = {
    fonts.packages = with pkgs; [
      corefonts
      # General Noto fonts
      noto-fonts
      noto-fonts-color-emoji
      # CJK specific fonts (Sans and Serif)
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      # An alternative popular Chinese font
      wqy_zenhei
      # Other potential CJK fonts
      mplus-outline-fonts.osdnRelease
      

      liberation_ttf
      times-newer-roman
      ubuntu-classic
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.noto

      hack-font
      font-awesome
      iosevka
    ];

    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      
      fontconfig = {
        defaultFonts = {
          serif = ["Times Newer Roman"];
          sansSerif = ["Noto Sans"];
          monospace = ["Iosevka"];
        };
      };
    };
  };
}