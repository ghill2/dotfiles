#!python3
import os
from pathlib import Path
from common import create_cmd_str

def main(dir):
    assert Path(f"./.envrc").resolve().exists()
    cmds = [
        f"cd {dir}",
        # "rm -rf ./{.direnv,.venv}", # remove environment
        "direnv allow",
        "python3 -m pip install --upgrade pip",
        "poetry install --with test,dev --all-extras",
        # ("cd nautilus_core && cargo clean && cd ..", ";"),  # avoid Blocking for Blocking waiting for file lock on build directory
        # ("rm -rf ~/.cargo/.package-cache", ";"),  # to avoid Blocking for package cache
        "poetry lock", # incase lock file gets replaced by git incorrectly
        "poetry install --all-extras",
        "python3 ./build.py",
    ]

    cmd = create_cmd_str(cmds)
    status = os.system(cmd)

if __name__ == "__main__":
    main(".")