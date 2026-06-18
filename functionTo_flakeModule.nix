{
  flake-parts-lib,
  self,
  ...
}: let
  inherit (flake-parts-lib) importApply;
in {
  flake.flakeModules.default = importApply ./flakeModule.nix {
    providerFlake = self;
  };
}
