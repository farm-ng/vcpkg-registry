#!/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Expects vcpkg to be installed as a submodule
./vcpkg/bootstrap-vcpkg.sh

# Update the versions database
# https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry#4---update-the-versions-database
./vcpkg/vcpkg \
  --x-builtin-ports-root=$DIR/ports \
  --x-builtin-registry-versions-dir=$DIR/versions \
  x-add-version \
  --all \
  --verbose