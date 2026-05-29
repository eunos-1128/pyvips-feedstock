@echo on
setlocal enabledelayedexpansion

%PYTHON% %RECIPE_DIR%\make_lcms2_pc.py

dir %LIBRARY_LIB%\*.lib
:: if exist %LIBRARY_LIB%\libarchive.lib copy %LIBRARY_LIB%\libarchive.lib %LIBRARY_LIB%\archive.lib
:: if exist %LIBRARY_LIB%\zlib.lib copy %LIBRARY_LIB%\zlib.lib %LIBRARY_LIB%\z.lib
:: if exist %LIBRARY_LIB%\libbz2.lib copy %LIBRARY_LIB%\libbz2.lib %LIBRARY_LIB%\bz2.lib
:: if exist %LIBRARY_LIB%\liblzma.lib copy %LIBRARY_LIB%\liblzma.lib %LIBRARY_LIB%\lzma.lib
:: if exist %LIBRARY_LIB%\liblz4.lib copy %LIBRARY_LIB%\liblz4.lib %LIBRARY_LIB%\lz4.lib
:: if exist %LIBRARY_LIB%\libzstd.lib copy %LIBRARY_LIB%\libzstd.lib %LIBRARY_LIB%\zstd.lib

@REM Ensure we can find the vips package
pkg-config --exists --print-errors vips
%PYTHON% -m pip install . --no-deps --ignore-installed -vv
