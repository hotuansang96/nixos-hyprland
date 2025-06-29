{ config, pkgs, ... }:

{
  home.username = "sanght";
  home.homeDirectory = "/home/sanght";
  home.stateVersion = "24.05";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "eDP-1,preferred,auto,1";
      exec-once = [
        "swww init"
        "swww img ~/Pictures/wallpaper.jpg"
        "waybar"
        "mako"
      ];
      input.kb_layout = "us";
      general.gaps_in = 5;
    };
  };

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];
    }];
    style = builtins.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/waybar/main/themes/mocha.css";
      sha256 = "sha256-TODO"; # bạn có thể để trống để lấy style sau
    });
  };

  services.mako.enable = true;
  programs.kitty.enable = true;
  programs.wofi.enable = true;

  programs.zsh.enable = true;

  services.cliphist.enable = true;
  home.packages = with pkgs; [
    swww
    wl-clipboard
    hyprlock
    cliphist
  ];
}

