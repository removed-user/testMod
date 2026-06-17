# The local/provider/YOUR flake "providing" functionality to consumer flakes
# Avoiding the name local because... - it's less confusing for us, but passes the problem on to anyone using the flake
#
# This outer function layer is evaluated and resolved by the importApply function
{
  providerFlake,
  withSystem,
}:
# preserving debug info and processing local logic, before returning the below inner function as a module
# 2. Standard flake-parts module function, but now importApplied
{
  config,
  lib,
  ...
}: {
  config = {
    # Example: Exposing a package from the provider flake into the consumer flake
    perSystem = {system, ...}: {
      # Use withSystem to safely extract the matching package architecture
      _module.args.myPackage = withSystem system ({config, ...}: config.packages.default);
    };
  };
}
