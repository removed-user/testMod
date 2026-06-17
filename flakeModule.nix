{ flake-parts-lib, self, withSystem, ... }:
let
  inherit (flake-parts-lib) importApply;
in
{
  flake.flakeModules.default = importApply ./flake-module.nix { localFlake = self; inherit withSystem; };
}
