{ pkgs, ... }: {
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  ## Fallback (agar Wayland env o‘chib qolsa)
  home.sessionVariables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  ## GNOME uchun majburiy dconf enable (kerak bo‘ladi)
  programs.dconf.enable = true;
}
