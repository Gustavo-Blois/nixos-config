{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = mad: {

  nixosConfigurations."MetalQueerSolid" = mad.nixpkgs.lib.nixosSystem{
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
    ];
    specialArgs = {
      inherit mad;
    };
  };

  };
}
