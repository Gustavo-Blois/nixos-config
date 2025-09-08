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



  environment.systemPackages = with pkgs;
  [
    minicom
    usbutils
  ];
}
