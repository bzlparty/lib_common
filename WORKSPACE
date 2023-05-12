workspace(
    name = "mgred_bazel_lib",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_stardoc",
    sha256 = "3fd8fec4ddec3c670bd810904e2e33170bedfe12f90adf943508184be458c8bb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz",
        "https://github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz",
    ],
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()

http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "mgred_rules_pandoc",
    sha256 = "0c1f3f27a982b5ffbc2cca74d7062d43fea70a234587165b7b211bd2f6c5d6bc",
    strip_prefix = "rules_pandoc-0.0.2",
    url = "https://github.com/mgred/rules_pandoc/releases/download/v0.0.2/rules_pandoc-v0.0.2.tar.gz",
)

load("@mgred_rules_pandoc//pandoc:repositories.bzl", "LATEST_PANDOC_VERSION", "pandoc_register_toolchains")

pandoc_register_toolchains(
    name = "pandoc",
    pandoc_version = LATEST_PANDOC_VERSION,
)
