@echo on
setlocal enabledelayedexpansion

%PYTHON% %RECIPE_DIR%\make_lcms2_pc.py

@REM Drop Unix-only libm from pkg-config-derived libraries on MSVC
%PYTHON% %RECIPE_DIR%\patch_pyvips_build.py

copy %LIBRARY_LIB%\bzip2.lib %LIBRARY_LIB%\bz2.lib 
copy %LIBRARY_LIB%\liblzma.lib %LIBRARY_LIB%\lzma.lib
copy %LIBRARY_LIB%\libcrypto.lib %LIBRARY_LIB%\crypto.lib
copy %LIBRARY_LIB%\libssl.lib %LIBRARY_LIB%\ssl.lib

@REM Ensure we can find the vips package
pkg-config --exists --print-errors vips
%PYTHON% -m pip install . --no-deps --ignore-installed -vv
