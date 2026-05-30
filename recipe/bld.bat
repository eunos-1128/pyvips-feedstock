@echo on
setlocal enabledelayedexpansion

@REM Remove this build time fix after handling is complete in lcms2-feedstock
@REM Ref: https://github.com/conda-forge/pyvips-feedstock/pull/40#discussion_r3326810420
%PYTHON% %RECIPE_DIR%\make_lcms2_pc.py

@REM Switch default pkg-config implementation to pkgconf
@REM https://github.com/conda-forge/conda-forge.github.io/issues/1880
set PKG_CONFIG=pkgconf

@REM Ensure we can find the vips package
pkgconf --exists --print-errors vips
%PYTHON% -m pip install . --no-deps --ignore-installed -vv
