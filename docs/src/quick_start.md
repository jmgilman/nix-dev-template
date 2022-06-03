# Quick Start

Add the flake as an input:

```nix
{
  inputs = {
    # ...
    nixago.url = "github:jmgilman/nixago";
    # ...
  };
}
```

Choose a plugin to use. The below example uses the plugin for [pre-commit][1]:

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

The easiest way to integrate the generated configuration into your development
environment is to use the provided shell hook:

```nix
{
# ...
    devShell = pkgs.mkShell {
        shellHook = nixago.lib.mkShellHook [ preCommit ];
    };
# ...
}
```

The hook will automatically link the file from the Nix store to the current
working directory. The above example will produce a `.pre-commit-config.yaml`
file with the following contents:

```yaml
repos:
  - hooks:
      - entry: /nix/store/pmfl7q4fqqibkfz71lsrkcdi04m0mclf-nixpkgs-fmt-1.2.0/bin/nixpkgs-fmt
        files: \.nix
        id: nixpkgs-fmt
        language: system
        name: nixpkgs-fmt
    repo: local
```

## Making Multiple Configurations

A utility function is available for generating multiple configurations. The
following is an excerpt from the `flake.nix` that manages this project:

```nix
{
# Define development tool configuration
    configurations = {
        # Just configuration
        "just" = {
            tasks = {
                check = [
                    "@${tools.nixpkgs-fmt.exe} --check flake.nix $(git ls-files '**/*.nix')"
                    "@${tools.prettier.exe} --check ."
                    "@${tools.typos.exe}"
                    "@nix flake check"
                ];
                check-docs = [
                    "@${tools.typos.exe}"
                ];
                make-docs = [
                    "@cd docs && mdbook build"
                ];
                fmt = [
                    "@${tools.nixpkgs-fmt.exe} flake.nix $(git ls-files '**/*.nix')"
                    "@${tools.prettier.exe} -w ."
                ];
            };
        };
        # Lefthook configuration
        "lefthook" = {
        pre-commit = {
            commands = {
                nixpkgs-fmt = {
                    run = "${tools.nixpkgs-fmt.exe} --check {staged_files}";
                    glob = "*.nix";
                };
                prettier = {
                    run = "${tools.prettier.exe} --check {staged_files}";
                    glob = "*.{yaml,yml,md}";
                };
                typos = {
                    run = "${tools.typos.exe} {staged_files}";
                };
            };
        };
        };
        # Prettier
        "prettier.mkIgnoreConfig" = [
            ".direnv"
            "tests"
            "lefthook.yml"
        ];
    };

    # ...

    # Local development shell
    devShells = {
        default = pkgs.mkShell {
            shellHook = (lib.mkAll configurations).shellHook;
            packages = tools.all;
        };
    };
}
```

The input to `mkAll` expects an attribute set where the name is one of the
following:

1. A path to the function to be called, relative to the `plugins` set (i.e.,
   `prettier.mkIgnoreConfig`)
2. The name of a plugin with `.opts` appended (i.e., `prettier.opts`)

Appending the function name after the plugin name is optional. In this case, the
`mkAll` function will call the `default` function. This function is specific to
each plugin; refer to the source code for what is called.

The value of the attribute should be the raw configuration data that will be
passed to the function. All plugin functions take a `configData` argument which
contains the configuration data. This argument is supplied with the value of the
attribute.

Some plugin functions accept additional arguments beyond `configData`. To pass
other arguments using the `mkAll` function, you must add an extra attribute in
the format of `pluginName.opts`. The value of this attribute should be a set
that will be merged into the final call to the plugin function.

The `default` function will be called from the plugin in the second case. See
the individual plugins for which function this is. The second parameter is the
configuration to be passed. The result is an attribute set with a unified
`shellHook` attribute that contains all of the logic for managing the
configurations. This result makes it seamless to add additional configurations
to your existing projects.

[1]: https://pre-commit.com/
