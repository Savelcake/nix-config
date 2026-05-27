{ config, pkgs, username, hostname, ... }:

{

  environment.extraInit = ''
    export PATH="$HOME/.commands:$HOME/.scripts:$PATH"
    export XDG_DATA_DIRS="$HOME/.applications:$XDG_DATA_DIRS"
  '';

  environment.sessionVariables = {
    # TMPDIR = "/var/tmp";

    NIXOS_OZONE_WL = "1";
    
    XCURSOR_THEME = "Adwaita"; 
    XCURSOR_SIZE = "24";

    FREETYPE_PROPERTIES = "truetype:interpreter-version=40 cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";

    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    
    EDITOR = "nvim";

  };

}
