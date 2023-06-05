#!/usr/bin/env bash
# NOTE: This file is taken from https://github.com/bazel-contrib/rules-template/blob/main/.github/workflows/release_prep.sh
# and slightly modified.

set -o errexit -o nounset -o pipefail

# Set by GH actions, see
# https://docs.github.com/en/actions/learn-github-actions/environment-variables#default-environment-variables
TAG=${GITHUB_REF_NAME}
# The prefix is chosen to match what GitHub generates for source archives
PREFIX="bazel_lib-${TAG:1}"
ARCHIVE="bazel_lib-$TAG.tar.gz"
git archive --format=tar --prefix=${PREFIX}/ ${TAG} | gzip > $ARCHIVE
SHA=$(shasum -a 256 $ARCHIVE | awk '{print $1}')

cat << EOF
Paste this snippet into your `WORKSPACE.bazel` file:

\`\`\`starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "mgred_bazel_lib",
    sha256 = "${SHA}",
    strip_prefix = "${PREFIX}",
    url = "https://github.com/mgred/bazel_lib/releases/download/${TAG}/${ARCHIVE}",
)
\`\`\`
EOF
