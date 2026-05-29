import json
import os
from pathlib import Path

prefix = Path(os.environ["PREFIX"])
library_prefix = Path(os.environ["LIBRARY_PREFIX"])

candidates = sorted((prefix / "conda-meta").glob("lcms2-*.json"))
if not candidates:
    raise RuntimeError(f"Could not find lcms2 metadata under {prefix / 'conda-meta'}")

with candidates[0].open(encoding="utf-8") as f:
    version = json.load(f)["version"]

pc_dir = library_prefix / "lib" / "pkgconfig"
pc_dir.mkdir(parents=True, exist_ok=True)

lib_prefix = library_prefix.as_posix()

pc_text = f"""prefix={lib_prefix}
libdir=${{prefix}}/lib
includedir=${{prefix}}/include

Name: lcms2
Description: Little CMS color management library
Version: {version}
Libs: -L${{libdir}} -llcms2
Cflags: -I${{includedir}}
"""

pc_path = pc_dir / "lcms2.pc"
pc_path.write_text(pc_text, encoding="utf-8")

print(f"Wrote {pc_path}")
print(pc_text)
