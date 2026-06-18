{
  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-parts.url = "github:removed-user/flake-parts/Add-a-Check-in-mkTransposedPersystemModule";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      debug = true;
      disabledModules = [
        inputs.flake-parts.flakeModules.nixosModules
        inputs.flake-parts.flakeModules.nixosConfigurations
        inputs.flake-parts.flakeModules.apps
        inputs.flake-parts.flakeModules.devShells
        inputs.flake-parts.flakeModules.formatter
      ];

      imports = [
        inputs.flake-parts.flakeModules.flakeModules
        inputs.flake-parts.flakeModules.modules
        inputs.flake-parts.flakeModules.debug
      ];

      # 3. Downstream export
      flake.flakeModules.default = ./flakeModule.nix;
    };
}
