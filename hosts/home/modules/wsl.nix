{ config, pkgs, username, ... }:

{
  wsl = {
    enable = true;
    defaultUser = username;
    
    # Automount Windows partitions (like C:\) under /mnt
    automountPath = "/mnt";
    
    # Register support for executing Windows binaries (such as code.exe or explorer.exe)
    interop.register = true;
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
