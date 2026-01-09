{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}
