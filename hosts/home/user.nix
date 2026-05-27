{ config, pkgs, inputs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"  "input" "uinput" ];
    shell = pkgs.fish; 
    autoSubUidGidRange = true;
  };

  security.sudo.extraRules = [
    {
      users = [ "${username}" ];
      commands = [
        { 
          command = "/run/current-system/sw/bin/awg";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
