{
  description = "Entry Point for NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:vic/import-tree";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:
  let
    identity = import ./identity.nix;
    hostPath = "${identity.repoPath}/hosts/${identity.hostname}";
    dot = "${identity.repoPath}/dotfiles";
  in {
    nixosConfigurations.${identity.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs identity hostPath dot;
        inherit (identity) username hostname repoPath;
        stable = import nixpkgs-stable {
          system = "x86_64-linux"; 
          config.allowUnfree = true;
        };
      };
      modules = [
      ./default.nix
      inputs.nixos-wsl.nixosModules.default
      ];
    };
  };
}
