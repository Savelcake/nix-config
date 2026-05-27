{ pkgs, inputs, stable, ... }:

{
  environment.systemPackages = with pkgs;[

    # System
    wget
    unzip
    gcc
    tree
    killall
    jq
    jaq
    yq-go
    ydotool
    wtype
    wev
    xhost
    pulseaudio
    gnome-disk-utility
    sshfs
    tcpdump
    mkcert
    mesa-demos
    waffle
    apitrace
    openssl

    # Desktop
    libnotify
    wl-clipboard

    # Terminal Programs
    foot
    kitty
    alacritty
    btop
    repomix
    ripgrep
    bat
    fd
    fastfetch
    starship
    hyperfine
    lazygit
    git-filter-repo
    taplo
    amneziawg-tools

    # Virtualization
    distrobox

    # Media
    stable.mpv
    imv
    mpc
    rmpc
    flac
    flac2all
    mediainfo
    imagemagick
    puddletag
    roomeqwizard
    transmission_4
    ffmpeg
    intermodal
    aria2

    # Themes and Icons
    nwg-look
    adwaita-icon-theme
    
    # Nix
    nh
    nvd
    nix-output-monitor
  ];
}
