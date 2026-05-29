@echo on
setlocal enabledelayedexpansion

%PYTHON% %RECIPE_DIR%\make_lcms2_pc.py

@REM Switch default pkg-config implementation to pkgconf
@REM https://github.com/conda-forge/conda-forge.github.io/issues/1880
set PKG_CONFIG=pkgconf

@REM Ensure we can find the vips package
pkgconf --exists --print-errors vips
%PYTHON% -m pip install . --no-deps --ignore-installed -vv
