{ ... }:

{
  flake.nixosModules.system = { id, ... }: {
    time.timeZone = "Europe/Moscow";

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    system.stateVersion = "26.05";

    users.users.${id.user} = {
      isNormalUser = true;
      description = "nixos";
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      initialPassword = "nixos";
    };
  };
}
