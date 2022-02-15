#!/bin/bash

HERE="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

mkdir -p "$HERE/mint-x-icons"

cat "$HERE/icon-names.txt" | while read name; do
  icon_path="$(find /usr/share/icons/Mint-X/*/48 -name "$name".\* | head -1)"
  if [ -z "$icon_path" ]; then
    >&2 echo "not found: $name"
    continue
  fi
  ln -fs "$icon_path" "$HERE/mint-x-icons/"
done