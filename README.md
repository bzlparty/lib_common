# bazel_lib

> Common functions for Bazel rules.

## Installation

```python
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "mgred_bazel_lib",
    tag = "v0.0.0",
    remote = "https://github.com/mgred/bazel_lib.git",
)
```

## API

```python
load("@mgred_bazel_lib//:defs.bzl", "...")
```

**List**

* `filter`
* `map`

## Development

```bash
git clone https://github.com/mgred/bazel_lib.git
```

[Install pre-commit](https://pre-commit.com/#installation) and add all hooks to the repository:

```bash
pre-commit install
```

Run tests:

```bash
bazel test //:defs_test
```
