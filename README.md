![logo](logo.svg)

<p align="center">
    <a href="https://github.com/nix-community/nixago/actions/workflows/ci.yml">
        <img src="https://img.shields.io/github/workflow/status/nix-community/nixago/CI?label=CI"/>
    </a>
    <a href="https://nix-community.github.io/nixago">
        <img src="https://img.shields.io/github/workflow/status/nix-community/nixago/CI?label=Docs"/>
    </a>
    <img src="https://img.shields.io/github/license/nix-community/nixago"/>
    <a href="https://builtwithnix.org">
        <img src="https://img.shields.io/badge/-Built%20with%20Nix-green">
    </a>
</p>

> Generate configuration files using [Nix][1].

Ready to dynamically generate configuration files in your flake-based setup?
Nixago is a flake library for generating configuration files using Nix
expressions as the data source.

## Features

- Specify configuration data using native [Nix][1] syntax
- Generate configuration files using any of the [supported engines][2]
- Places all artifacts in the Nix store
- [Extensions][3] are provided for getting started

## Usage

Add Nixago as an input to your `flake.nix`:

```nix
{
  inputs = {
    # ...
    nixpkgs.url = "github:nixos/nixpkgs";
    nixago.url = "github:nix-community/nixago";
    nixago.inputs.nixpkgs.follows = "nixpkgs";
    # ...
  };
}
```

### Generate a Configuration

Nixago offers [various engines][2] which can be used for transforming input data
into an output file. Nixago will default to the [nix engine][4] that utilizes
`pkgs.formats` from [nixpkgs][5].

```nix
let
  data = {
    "field1" = "value1";
    "field2" = true;
  };
in
nixago.lib.make {
  inherit data;
  output = "config.json";
  format = "json"; # Optional if it matches the file extension
  engine = nixago.engines.nix { }; # Optional as this is the default engine
}
```

The result of this invocation will be an attribute set with two attributes:

- `configFile`: A derivation for building the configuration file.
- `shellHook`: A shell hook for managing the file.

Building the derivation produces a file with the following output:

```json
{
  "field1": "value1",
  "field2": true
}
```

The `make` function takes an attribute set that supports the options defined in
the [request module][6]. Please refer to the module definition for all of the
available options.

### Using the Shell Hook

The generated shell hook will link the generated configuration file to one of
two places:

- If `$PRJ_ROOT` is defined, the file will be linked to `$PRJ_ROOT/{output}`
  where `output` is the relative path defined in the call to `make`.
- If `$PRJ_ROOT` is not defined, the file will be linked to `./{output}`, where
  the relative path is determined by where the Nix CLI was invoked.

For example, if `$PRJ_ROOT` is set to `/home/user/code/myprj` and the output is
specified as `configs/config.json` then the file will be linked to
`/home/user/code/myprj/configs/config.json`.

The shell hook is designed to be integrated into a development shell:

```nix
{
  # ...
  devShells = {
    default = pkgs.mkShell {
      shellHook = (nixago.lib.make config).shellHook;
    };
  };
 # ...
}
```

This will ensure the file is generated and linked when you enter the shell. The
behavior of the hook can be modified via the [available options][7].

See [the documentation][8] for further configuration details.

## Extending Nixago

An [additional repository][9] is available that provides extensions for Nixago.
These simplify the process of generating configuration files for common
development tools.

## Testing

Tests are run with:

```shell
nix flake check
```

## Contributing

[Read this][10], check out the [issues][11] for items needing attention or
submit your own, and then:

1. Fork the repo (<https://github.com/nix-community/nixago/fork>)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Pull Request

[1]: https://nixos.org/
[2]: https://nix-community.github.io/nixago/engines/index.html
[3]: https://github.com/nix-community/nixago-extensions
[4]: https://nix-community.github.io/nixago/engines/nix.html
[5]: https://github.com/NixOS/nixpkgs/blob/master/pkgs/pkgs-lib/formats.nix
[6]: https://github.com/nix-community/nixago/blob/master/modules/request.nix
[7]: https://github.com/nix-community/nixago/blob/master/modules/request.nix#L8
[8]: https://nix-community.github.io/nixago/introduction.html
[9]: https://github.com/nix-community/nixago-extensions
[10]: https://nix-community.github.io/nixago/contributing
[11]: https://github.com/nix-community/nixago/issues
