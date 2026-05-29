from pathlib import Path

path = Path("pyvips/pyvips_build.py")
text = path.read_text()

old = "import pkgconfig"
new = """import pkgconfig

# Work around pkg-config emitting Unix-only libm on MSVC.
_orig_parse = pkgconfig.parse

def _parse(name):
    config = _orig_parse(name)
    config["libraries"] = [
        lib for lib in config.get("libraries", [])
        if lib != "m"
    ]
    return config

pkgconfig.parse = _parse
"""

if old not in text:
    raise RuntimeError(f"Could not find expected text in {path}")

path.write_text(text.replace(old, new, 1))
