{ ... }:

let
  id = {
    user = "hindlers";
    email = "savelponomar@gmail.com";
    repoPath = "/mnt/dev/cloned/nix-savel";
  };
in
{
  flake.nixosModules.id = { ... }: {
    _module.args.id = id;
  };
}
