/** Concatenates a list of configurations together
*/
{ pkgs, lib }:
all:
with pkgs.lib;
let
  result = builtins.map lib.make all;

  # Only include common shell code once
  common = (import ./hooks/common.nix);
  shellHook = common + "\n" +
    builtins.replaceStrings [ common ] [ "" ]
      (concatStringsSep "\n"
        (pkgs.lib.catAttrs "shellHook" result));
in
{
  inherit shellHook;
  configs = catAttrs "configFile" result;
}
