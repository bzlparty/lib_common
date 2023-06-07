# bazel_lib

> Common functions for Bazel rules.

[![Test](https://github.com/mgred/bazel_lib/actions/workflows/test.yaml/badge.svg?branch=main&event=push)](https://github.com/mgred/bazel_lib/actions/workflows/test.yaml)

## Installation

Add the usual snippet from the [release details](https://github.com/mgred/bazel_lib/releases) to the `WORKSPACE` file.

## API

```python
load("@mgred_bazel_lib//:defs.bzl", "...")
```

**List**

* `every`
* `filter`
* `map`
* `occurs`
* `some`

## Development

**Setup**

```bash
git clone https://github.com/mgred/bazel_lib.git
```

[Install pre-commit](https://pre-commit.com/#installation) and add all hooks to the repository:

```bash
pre-commit install
```

**Tests**

```bash
bazel test //:defs_test
```

**Documentation**

When changing in-code documentation, run:

```bash
bazel run //:docs_update
```
