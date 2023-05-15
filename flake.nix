{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Troca aqui o "nixos" pelo hostname do seu PC, caso vc troque ele no futuro
      nixos = nixpkgs.lib.nixosSystem {
        # A config principal
        modules = [ ./nixos/configuration.nix ];
        # Isso aqui permite que a gente acesse os `inputs` dentro da config
        specialArgs = { inherit inputs; };
      };
    };
  };
}

