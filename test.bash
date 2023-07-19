#!/bin/bash
PARENT="$(dirname "$(realpath "$(readlink -f "${BASH_SOURCE:-$0}" 2>/dev/null || echo "${BASH_SOURCE:-$0}")")")"
GPARENT="$(dirname "$(dirname "$(realpath "$(readlink -f "${BASH_SOURCE:-$0}" 2>/dev/null || echo "${BASH_SOURCE:-$0}")")")")"

# TODO exclude .exe and binary files
selected_file=$(ls -p $PARENT "$PARENT/bin" "$GPARENT/notes" \
    | grep -v / \
    | grep -vE "_z" \
    | choose)

code $selected_file --reuse-window

code "/Users/g1/BU/projects/dotfiles/.Brewfile" --reuse-window