{ pkgs, ... }: {
  users.users.hindlers = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "nixos";
  };
}
