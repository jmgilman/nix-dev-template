# Nixago

<p align="center">
    <a href="https://github.com/jmgilman/nixago/actions/workflows/ci.yml">
        <img src="https://img.shields.io/github/workflow/status/jmgilman/nixago/CI?label=CI"/>
    </a>
    <a href="https://jmgilman.github.io/nixago">
        <img src="https://img.shields.io/github/workflow/status/jmgilman/nixago/CI?label=Docs"/>
    </a>
    <img src="https://img.shields.io/github/license/jmgilman/nixago"/>
    <a href="https://builtwithnix.org">
        <img src="https://img.shields.io/badge/-Built%20with%20Nix-green">
    </a>
</p>

> Generate configuration files with [Nix][1] + [CUE][2]

## Features

- Specify configuration data using native Nix syntax
- Validate configuration data using the language features from [Cue][2]
- Generate configuration files in any of the [supported formats][3]
- Places all artifacts in the Nix store
- Provides plugins for generating several types of development configuration
  files

## Usage

Add the flake as an input:

```nix
{ #....
  inputs = {
    # ...
    nixago.url = "github:jmgilman/nixago";
  };
}
```

Plugins are available for quickly generating configuration files. For example, a
[pre-commit][4] configuration:

```nix
{
# ...
    preCommitConfig = {
        nixpkgs-fmt = {
            entry = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
            language = "system";
            files = "\\.nix";
        };
    };

    preCommit = nixago.plugins.pre-commit.mkLocalConfig {
        configData = preCommitConfig;
    };
# ...
}
```

The flake generates a shell hook for linking the configuration file to the root
of the current working directory. The hook will automatically pick up changes
and re-link as necessary.

```nix
{
# ...
    devShell = pkgs.mkShell {
        shellHook = nixago.lib.mkShellHook [ preCommit ];
    };
# ...
}
```

See [the docs][5] for more information.

## Testing

Tests are run with:

```shell
nix flake check
```

## Contributing

[Read this][6], check out the [issues][7] for items needing attention or submit
your own, and then:

1. Fork the repo (<https://github.com/jmgilman/nixago/fork>)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Pull Request

[1]: https://nixos.org/
[2]: https://cuelang.org/
[3]: https://cuelang.org/docs/integrations/
[4]: https://pre-commit.com/
[5]: https://jmgilman.github.io/nixago/
[6]: https://jmgilman.github.io/nixago/contributing/design
[7]: https://github.com/jmgilman/nixago/issues
