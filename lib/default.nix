{ pkgs, lib }:
{
  inherit (import ../modules/default.nix { inherit pkgs lib; }) mkRequest;
  make = import ./make.nix { inherit pkgs lib; };
  makeAll = import ./make_all.nix { inherit pkgs lib; };
  makeHook = import ./hooks { inherit pkgs lib; };
}
