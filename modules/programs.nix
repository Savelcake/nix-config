{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    ungoogled-chromium

    git

    neovim
    gcc
    tree-sitter
  ];
}
