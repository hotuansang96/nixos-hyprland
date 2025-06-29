{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "macbook-utmm3";
  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  users.users.sanght = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" "video" "audio" ];
    shell = pkgs.zsh;
  };

  services.getty.autologin = {
    enable = true;
    user = "sanght";
  };

  environment.systemPackages = with pkgs; [
    git vim wget curl neofetch
  ];

  programs.zsh.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
  };

  sound.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  system.stateVersion = "24.05";
}

