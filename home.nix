{ config, pkgs, ... }:
 
{
  # Iltimos, foydalanuvchi nomini va uy katalogini oʻz holatingizga moslang
  home.username = "muhammad";
  home.homeDirectory = "/home/muhammad";

  imports = [
    ./modules/zsh
  ];

 
  # Joriy katalogdagi konfiguratsiya faylini koʻrsatilgan joyga bogʻlash
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;
 
  # `./scripts` ichidagi barcha fayllarni `~/.config/i3/scripts` ga bogʻlash
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # rekursiv bogʻlash
  #   executable = true;  # barcha fayllarni bajariladigan qilish
  # };
 
  # Fayl mazmunini toʻgʻridan-toʻgʻri nix konfiguratsiyasiga yozish
  # home.file.".xxx".text = ''
  #     xxx
  # '';
 
  # Foydalanuvchi profiliga oʻrnatilishi kerak boʻlgan paketlar
  home.packages = with pkgs; [
    # ushbu keltirilganlar men kunlik davomida ishlatadiganlarim
    # o'zingiznikini qo'shish yoki keltirilganlardan olib tashashdan tortinmang
    
    neofetch
    nnn # terminal fayl menejer
    
    # arxivlar
    zip
    xz
    unzip
    p7zip
    vim

    telegram-desktop
    google-chrome
    btop
    chromium

    #coding
    vscode
    flutter
    
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer

    gcc

    # hardware
    # Ovoz va mikrofon uchun kerakli dasturlar
    alsa-utils    # alsamixer va boshqa alsa vositalari uchun
    noisetorch    # Shovqinni yo'qotish uchun
    pavucontrol   # Grafik ovoz mikseri (juda foydali!)

    libreoffice-qt-fresh
  ];
 
  # oddiy git sozlamari, o'zingizga moslang
  programs.git = {
    enable = true;
    userName = "sud0pacman";
    userEmail = "mukhammad.kammoliddin@gmail.com";
  };


  # === NOISETORCH AVTOMATIK ISHGA TUSHIRISH UCHUN XIZMAT ===
  systemd.user.services.noisetorch = {
    Unit = {
      Description = "NoiseTorch Noise Suppression";
      # PipWire ishga tushgandan so'ng ishga tushishi uchun
      After = [ "pipewire.service" ];
      PartOf = [ "pipewire.service" ];
    };
    Service = {
      # Sizning mikrofon manbaingizni shu yerga qo'ying!
      ExecStart = "${pkgs.noisetorch}/bin/noisetorch -i alsa_input.pci-0000_00_1f.3.analog-stereo";
      # Agar xatolik yuz bersa, qayta ishga tushirish
      Restart = "on-failure";
    };
    Install = {
      # Foydalanuvchi tizimga kirganda avtomatik ishga tushishi uchun
      WantedBy = [ "default.target" ];
    };
  };
  # === XIZMAT TUGADI ===
  

  # starship - istalgan buyruq satri ko'rinishi o'zgartiruvchi
  programs.starship = {
    enable = true;
    # moslangan sozlamalar
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

 
  # alacritty - platformalarar-o, GPU orqali tezlatilgan buyruq satr emulyatori
  programs.alacritty = {
    enable = true;
    # moslangan sozlamalar
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
 
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # ESLATMA o'zingizni bashrc'ingizni qo'shib keting
    bashrcExtra = ''
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export PATH="$PATH:$HOME/flutter/bin"
    '';
    
    # qiqartma nomlar qo'shing, xoh qo'shing, xoh olib tashlang
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      rebuild = "sudo nixos-rebuild switch --flake /home/muhammad/workplace/sud0pacman/nix-config#nixos";
      n = "neofetch";
    };
  };
  
  # PATH ga narsalarni qo‘shish
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # Chrome (Flutter web uchun)
  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium";
  };


  # GitHub SSH kaliti uchun agentni avtomatik ishga tushirish
  
 
  # Bu qiymat qaysi versiyadagi home-manager sozlamari bilan
  # to'g'ri kelishini belgilaydi. Bu ko'proq home manager ning
  # eski versiya bilan chiqishmaydigan yangi versiyasi chiqganda
  # buzilib qolishlar oldini oladi.
  # 
  # Shu qiymat o'zgartirmayam home manager yangilasa bo'ladi. Ba'tafsil
  # har bir relizda bo'lgan o'zgarishlar home managerning relizlar 
  # eslatmasida ko'zdan kechirib chiqing.
  home.stateVersion = "25.05";
 
  # Home Manager o'zini o'rnatishiga qo'yib beraylik
  programs.home-manager.enable = true;
}
