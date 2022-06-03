/* Create a template instance using the given data, files, and output.

  This function is a wrapper for creating instances of ../modules/template.nix.
  The three primary arguments (`config`, `files`, and `output`) are fed into the
  module configuration. The optional `shellHookExtra` argument can be supplied
  which is also fed into the module. The optional `flags` argument is fed into
  the module `specialArgs` and is used for passing additional flags to the
  underlying `cue eval` command. The function returns the evaluated config from
  the module.
*/
{ pkgs, lib }:
{ configData, files, output, postBuild ? "", shellHookExtra ? "", flags ? { }, ... }:
with pkgs.lib;
let
  result = evalModules {
    modules = [
      ../modules/template.nix
      {
        inherit configData files output postBuild shellHookExtra;
      }
    ];
    specialArgs = ({ inherit pkgs; flakeLib = lib; } // flags);
  };
in
result.config

