{ inputs, self, ... }:

{
  flake.nixosConfigurations.home = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs self; };
    modules = [
      inputs.disko.nixosModules.disko

      ./system.nix
      ./packages.nix
      ./hardware.nix
      ./disko.nix
    ] ++ (with self.nixosModules; [
      id
      system
      boot
      home-manager

      git
      nvim
      v2raya
      sing-box

      fish
      starship
      fuzzel
      polkit-agent

      cliphist
      thunar
      datamile
      photocraft

      discord
      ayugram
      steam
      pi

      web-apps

      mpd
      rmpc
      mpc
      mympd
      mympd-web-app
    ]);
  };
}
