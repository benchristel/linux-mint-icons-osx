#!/bin/bash

set -e

ROOT="$(cd $(dirname "${BASH_SOURCE[0]}") && cd .. && pwd)"

TRASH=/tmp/trashed-icons-$(date +%s)
mkdir -p "$TRASH"

>&2 echo "Moving generated folders to $TRASH"

mv "$ROOT"/actions \
   "$ROOT"/animations \
   "$ROOT"/apps \
   "$ROOT"/categories \
   "$ROOT"/devices \
   "$ROOT"/emblems \
   "$ROOT"/mimetypes \
   "$ROOT"/places \
   "$ROOT"/status \
   "$ROOT"/stock \
   "$TRASH"