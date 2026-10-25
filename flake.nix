{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = (map inputs.import-tree [
        ./core
        ./features
        ./programs
      ]) ++ [
        (inputs.import-tree.filter (path:
          let
            base = builtins.baseNameOf (toString path);
            parent = builtins.baseNameOf (builtins.dirOf (toString path));
          in
            base == "${parent}.nix"
        ) ./hosts)
      ];
    };
}
