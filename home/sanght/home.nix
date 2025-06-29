{ config, pkgs, ... }:

{
  home.username = "sanght";
  home.homeDirectory = "/home/sanght";

  home.stateVersion = "24.05";

  programs.zsh.enable = true;

  home.packages = with pkgs; [
    neovim
    alacritty
    waybar
    mako
    swww
    wofi
    hyprlock
    cliphist
    brightnessctl
    kitty
    catppuccin.alacritty
  ];

  wayland.windowManager.hyprland.enable = true;

  programs.waybar.enable = true;

  services.mako.enable = true;

  programs.git.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
    };
  };
}

