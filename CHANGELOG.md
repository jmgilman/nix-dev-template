# Changelog

## [3.1.0](https://github.com/nix-community/nixago/compare/v3.0.0...v3.1.0) (2024-04-25)


### Features

* add colors to nixago logs ([#48](https://github.com/nix-community/nixago/issues/48)) ([8c1f9e5](https://github.com/nix-community/nixago/commit/8c1f9e5f1578d4b2ea989f618588d62a335083c3))
* allow extra attributes that are transparently passed through ([#32](https://github.com/nix-community/nixago/issues/32)) ([59843d3](https://github.com/nix-community/nixago/commit/59843d34e6f369b65589dda00d2efe5d5164ce39))
* automatically add linked files to gitignore ([#43](https://github.com/nix-community/nixago/issues/43)) ([e157f2e](https://github.com/nix-community/nixago/commit/e157f2e78e0fcc00c3446c71b90944cdb2677316)), closes [#27](https://github.com/nix-community/nixago/issues/27)
* factorize shell scripts so that they can be composed more freely ([#40](https://github.com/nix-community/nixago/issues/40)) ([dd3c333](https://github.com/nix-community/nixago/commit/dd3c333e5cb6a81feb902e9eaa3cdbc2dc6da2c4))
* locate the request file, if possible ([#30](https://github.com/nix-community/nixago/issues/30)) ([f904f54](https://github.com/nix-community/nixago/commit/f904f54eb5b60414d6411d0d43eb33360b707e88))
* provide a stand-alone installation runnable for every hook ([#41](https://github.com/nix-community/nixago/issues/41)) ([8aa25d6](https://github.com/nix-community/nixago/commit/8aa25d69cb0c78c9ab7b72ef6291a093cf481218))
* reify requests ([#42](https://github.com/nix-community/nixago/issues/42)) ([1c8f4b3](https://github.com/nix-community/nixago/commit/1c8f4b38e5aa6348600747db9109baba3d7c0b95))
* **request:** default format value to file extension ([#37](https://github.com/nix-community/nixago/issues/37)) ([c893573](https://github.com/nix-community/nixago/commit/c893573b94c0c76b2a701c811ceceaaa10f1d4c6)), closes [#28](https://github.com/nix-community/nixago/issues/28)


### Bug Fixes

* 1000 nixpkgs; compat with numtide/nixpkgs-unfree ([#51](https://github.com/nix-community/nixago/issues/51)) ([d686345](https://github.com/nix-community/nixago/commit/d68634526733c79a2ca4fcc87c25a1ceabf132f4))
* **core:** recover the unbound freeformType contract per module system ([#34](https://github.com/nix-community/nixago/issues/34)) ([1640dd9](https://github.com/nix-community/nixago/commit/1640dd9bc8246b5ef23664b5160a1b7a5b4cf57c))
* don't leave traces in the hook's environment ([#46](https://github.com/nix-community/nixago/issues/46)) ([21272c3](https://github.com/nix-community/nixago/commit/21272c35589c3460ae1515b59c69a8e356baab02)), closes [#45](https://github.com/nix-community/nixago/issues/45)
* ensure gitignore entries are relative to root ([#54](https://github.com/nix-community/nixago/issues/54)) ([1da60ad](https://github.com/nix-community/nixago/commit/1da60ad9412135f9ed7a004669fdcf3d378ec630))
* **hook:** creates relative paths before linking/copying ([#36](https://github.com/nix-community/nixago/issues/36)) ([0fb7666](https://github.com/nix-community/nixago/commit/0fb76662c652c4b6668c73c357330d7457bc2ffe)), closes [#33](https://github.com/nix-community/nixago/issues/33)
* Only update .gitignore when a link is indeed created ([#56](https://github.com/nix-community/nixago/issues/56)) ([5133633](https://github.com/nix-community/nixago/commit/5133633e9fe6b144c8e00e3b212cdbd5a173b63d))
* run extra in subshell so that the environment is not messed up ([#44](https://github.com/nix-community/nixago/issues/44)) ([608abdd](https://github.com/nix-community/nixago/commit/608abdd0fe6729d1f7244e03f1a7f8a5d6408898))
* the quickstart guide ([#35](https://github.com/nix-community/nixago/issues/35)) ([3a5cb34](https://github.com/nix-community/nixago/commit/3a5cb3439fbeccafa1cb960435ba01800a7438db))
* unbound variable ([#55](https://github.com/nix-community/nixago/issues/55)) ([dacceb1](https://github.com/nix-community/nixago/commit/dacceb10cace103b3e66552ec9719fa0d33c0dc9))

## [3.0.0](https://github.com/nix-community/nixago/compare/v2.1.0...v3.0.0) (2022-06-17)


### ⚠ BREAKING CHANGES

* Simplifies external/internal API interface using engines (#23)

### Features

* adds flake template ([71abf4c](https://github.com/nix-community/nixago/commit/71abf4ce3e7c6e1ee17b00e70428d47784fb37fd))
* adds flake template ([2826e31](https://github.com/nix-community/nixago/commit/2826e3122a361398de6cd2eb80cb10456d8019f6))
* Simplifies external/internal API interface using engines ([#23](https://github.com/nix-community/nixago/issues/23)) ([e6a9566](https://github.com/nix-community/nixago/commit/e6a9566c18063db5b120e69e048d3627414e327d)), closes [#21](https://github.com/nix-community/nixago/issues/21)


### Bug Fixes

* isolates shell hooks and adds debugging information ([#20](https://github.com/nix-community/nixago/issues/20)) ([dd12078](https://github.com/nix-community/nixago/commit/dd1207883dd1b23f1c41917033a094b756916a9a))

## [2.1.0](https://github.com/jmgilman/nixago/compare/v2.0.0...v2.1.0) (2022-06-07)


### Features

* adds plugin for configuring Github ([#15](https://github.com/jmgilman/nixago/issues/15)) ([3506414](https://github.com/jmgilman/nixago/commit/3506414aa958712dadaa4b1f090bbcfd9086e5a6))
* Allows making configurations without a plugin  ([#12](https://github.com/jmgilman/nixago/issues/12)) ([7347fb7](https://github.com/jmgilman/nixago/commit/7347fb7067def9a752ea4c0bd22aaea9c6b54ce5))

## [2.0.0](https://github.com/jmgilman/nixago/compare/v1.0.0...v2.0.0) (2022-06-07)


### ⚠ BREAKING CHANGES

* standardizes the plugin interface (#10)
* adds argument for selecting copy/link mode and output path (#6)
* adds support for passing options to make functions (#4)

### Features

* adds argument for selecting copy/link mode and output path ([#6](https://github.com/jmgilman/nixago/issues/6)) ([59e664c](https://github.com/jmgilman/nixago/commit/59e664ca5de015eb9d232092e90f289b48ceabbc))
* adds support for passing options to make functions ([#4](https://github.com/jmgilman/nixago/issues/4)) ([c459955](https://github.com/jmgilman/nixago/commit/c4599555343c4e2e430ffe7d7bcd06bc7ea4483c))
* standardizes the plugin interface ([#10](https://github.com/jmgilman/nixago/issues/10)) ([2dea0bf](https://github.com/jmgilman/nixago/commit/2dea0bfb843f3a1a3133bbb8854df92d107978c3))

## 1.0.0 (2022-06-01)


### Features

* adds function for building multiple configurations ([298a2a1](https://github.com/jmgilman/nixago/commit/298a2a11078e043131ff38df4247cc2123391ee8))
* adds function for generating lefthook configuration files ([f68e646](https://github.com/jmgilman/nixago/commit/f68e646266df14dc8888c910985641762dbd6ef0))
* adds function for generating prettier ignore files and formats code ([027e0d2](https://github.com/jmgilman/nixago/commit/027e0d2d9083e84e6230e677123c14c6ac1674d8))
* adds generation of Just configuration files ([b603b08](https://github.com/jmgilman/nixago/commit/b603b0847fe9ee9758fca6ca76d9a4dd8c6c2388))
* adds mkShellHook ([b607c95](https://github.com/jmgilman/nixago/commit/b607c9547f2e60f53d9bcc36dc13d8b3e6c0f605))
* adds plugin for conform ([ad34da4](https://github.com/jmgilman/nixago/commit/ad34da40073d67f116d57f119b57f8cbbf3dd8bd))
* adds plugin for Prettier ([db28bf2](https://github.com/jmgilman/nixago/commit/db28bf231e153614bb09a89d34ee0d41f3a1020c))
* adds postBuild argument and formats justfile after generation ([aa68983](https://github.com/jmgilman/nixago/commit/aa68983f8190dcceef34ec574798cccaed847c27))
* adds pre-commit config generation ([c9d7faa](https://github.com/jmgilman/nixago/commit/c9d7faa93dd30a22333c4585da75ebcca54ba24d))
* adds simplified generator for pre-commit configs ([db5403f](https://github.com/jmgilman/nixago/commit/db5403f7f62ce23a8be7da1f3a1bf5f4656dde11))
* adds support for default functions using mkAll ([a4cf4f5](https://github.com/jmgilman/nixago/commit/a4cf4f59195449d7ea51b1510d3bdcca47045f51))


### Bug Fixes

* **conform:** simplifies configuration input ([c981459](https://github.com/jmgilman/nixago/commit/c981459b24552cf7d9a1bcc9a878932d7540587c))
* **just:** fixes improper formatting of tasks ([c64ad25](https://github.com/jmgilman/nixago/commit/c64ad255601b239d4fd05fe90816c25b15361afb))
