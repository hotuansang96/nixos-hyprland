{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "sanght";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.sanght = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    shell = pkgs.zsh;
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.windowManager.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    unzip
    hyprland
    kitty
    firefox
    brightnessctl
    zsh
  ];

  security.pam.services.hyprlock.enable = true;

  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  programs.zsh.enable = true;
}
