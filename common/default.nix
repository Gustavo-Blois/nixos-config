{pkgs, inputs, ...}:
{
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = '''';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake .#$HOSTNAME";
    };
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "linuxonly";
    };
  };
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };


  environment.localBinInPath = true;

  services.udev.extraRules = ''
SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660",GROUP="dialout", OWNER="gundrisse"
  '';

  environment.systemPackages = with pkgs;
  [
    python3
    qbittorrent
    minicom
    usbutils
    yt-dlp
    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull
    distrobox
    qemu
  ];
}
