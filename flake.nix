{
  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      # 2. Local module evaluation
      imports = [ ./modules/my-feature.nix ];

      # 3. Downstream export
      flake.flakeModules.default = ./modules/my-feature.nix;
    };
}
