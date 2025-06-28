{ config, pkgs, ... }:

{
  home.username = "sanght";
  home.homeDirectory = "/home/sanght";

  home.stateVersion = "24.05";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    alacritty
    neovim
    git
    waybar
    mako
    swww
    wofi
    hyprlock
    cliphist
    wl-clipboard
    pamixer
    brightnessctl
    catppuccin-gtk
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "swww-daemon"
        "swww img ~/Pictures/wall.png"
        "waybar"
        "mako"
        "hyprlock"
      ];
      bind = [
        "SUPER, Return, exec, alacritty"
        "SUPER, D, exec, wofi --show drun"
        "SUPER, Q, killactive,"
        "SUPER, L, exec, hyprlock"
      ];
    };
  };
}
