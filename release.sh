#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
  echo -e "\e[1;31mNo version supplied!\e[0m\n  Use like: ./release.sh v1.0.0"
  exit 1
fi

declare new_version=$1

echo -e "Release new version: \033[1m$new_version\033[0m"

# Replace the old version used in the install instructions of the README.md
# and commit the change, followed by a tag named after the new version.
sed --in-place "s/v[0-9]\+\.[0-9]\+\.[0-9]\+/$new_version/" README.md
git add README.md
git commit --message "release: $new_version"
git tag --annotate "$new_version" --message "Release, $new_version"
git push
git push --tags

echo -e "\e[1;32mDone\e[0m"
