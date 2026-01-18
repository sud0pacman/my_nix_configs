{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_title = true;
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 14.0;
      };

      colors.primary = {
        background = "#1a1b26";
        foreground = "#a9b1d6";
      };

      keyboard.bindings = [
        {
          key = "N";
          mods = "Control|Shift";
          action = "CreateNewWindow";
        }
        {
          key = "Plus";
          mods = "Control";
          action = "IncreaseFontSize";
        }
      ];
    };
  };
}
