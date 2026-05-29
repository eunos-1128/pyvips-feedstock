#!/bin/bash
set -exo pipefail

# Switch default pkg-config implementation to pkgconf
# https://github.com/conda-forge/conda-forge.github.io/issues/1880
export PKG_CONFIG=pkgconf

# Allow pkg-config to find xproto.pc
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$PREFIX/share/pkgconfig"

# Ensure we can find the vips package
pkgconf --exists --print-errors vips

${PYTHON} -m pip install . --no-deps --ignore-installed -vv
