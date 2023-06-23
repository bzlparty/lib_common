# Development

**Setup**

```bash
git clone https://github.com/bzlparty/lib_common.git
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
