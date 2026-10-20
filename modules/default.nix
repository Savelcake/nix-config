{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./disko.nix
    ./system.nix
    ./programs.nix
    ./user.nix

    ../programs/v2raya.nix
    # ../programs/sing-box.nix
  ];
}
