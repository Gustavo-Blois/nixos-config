
{ config, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Phosphophyllite"; # Define your hostname.
  programs.nix-ld.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  hardware.opentabletdriver.enable = true;
  # Enable the XFCE Desktop Environment.
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gundrisse = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Gundrisse";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #x  thunderbird
    ];
  };
virtualisation.podman = {
  enable = true;
  dockerCompat = true;
};


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts.packages = with pkgs; [
    noto-fonts-emoji
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
  ];
  environment.systemPackages =
  with pkgs; [
     ## VCS
     gh
     git
     jujutsu
     ##
     helix
     kitty
     discord

     ## WM qol
     waybar
     dunst
     rofi
     hyprcursor
     rose-pine-hyprcursor
     hyprpaper
     chezmoi

     ## misc
     nil
     direnv

     #VMs & containers
     distrobox
  ]
    ++ [
      inputs.zen-browser.packages.${pkgs.system}.default
      # inputs.pwndbg.packages.${pkgs.system}.pwndbg
    ];
  system.stateVersion = "25.05"; # Did you read the comment?

}
