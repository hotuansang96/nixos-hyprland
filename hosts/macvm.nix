{ config, pkgs, ... }:

{
  imports = [ ./../hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "macvm";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.sanght = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  system.stateVersion = "24.05";
}
