{
  description = "NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {

    nixosConfigurations = {
      Phosphophyllite = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
		      ./phosphophyllite
		      ./common
		     ];
      };
      AtomHeartOtter = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
		      ./atomheartotter
		      ./common
		     ];
      };
    };
  };
}
