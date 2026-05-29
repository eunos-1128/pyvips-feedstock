#!/bin/bash
set -exo pipefail
  
# Ensure we can find the vips package
pkg-config --exists --print-errors vips

${PYTHON} -m pip install . --no-deps --ignore-installed -vv
