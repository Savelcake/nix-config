{ pkgs, ... }: {

  # Networking & Time
  networking.hostName = "home";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Moscow";

  # PipeWire Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Flakes support & state version
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
