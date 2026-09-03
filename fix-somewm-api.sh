#!/bin/bash
# Safely revert dangerous "awesome → somewm" renames
# while keeping legitimate path/group/comment changes

set -e

echo "=== Fixing dangerous SomeWM API renames ==="

# 1. Core API that MUST stay as "awesome"
find . -type f \( -name "*.lua" -o -name "*.bak" \) -print0 | while IFS= read -r -d '' file; do
  # Skip backup files we create
  [[ "$file" == *".bak" ]] && continue

  # Make a backup
  cp "$file" "$file.bak"

  # Critical API renames (order matters)
  sed -i \
    -e 's/_G\.somewm\.spawn/_G.awesome.spawn/g' \
    -e 's/_G\.somewm\.restart/_G.awesome.restart/g' \
    -e 's/_G\.somewm\.quit/_G.awesome.quit/g' \
    -e 's/_G\.somewm\.startup_errors/_G.awesome.startup_errors/g' \
    -e 's/_G\.somewm\.startup/_G.awesome.startup/g' \
    -e 's/_G\.somewm\.connect_signal/_G.awesome.connect_signal/g' \
    -e 's/somewm\.spawn/awesome.spawn/g' \
    -e 's/somewm\.restart/awesome.restart/g' \
    -e 's/somewm\.quit/awesome.quit/g' \
    "$file"

  # Only keep the .bak if something actually changed
  if cmp -s "$file" "$file.bak"; then
    rm "$file.bak"
  else
    echo "Fixed: $file"
  fi
done

echo ""
echo "=== Done ==="
echo "Backups of changed files are saved as *.bak"
echo ""
echo "Now test with:"
echo "  somewm --check"
echo "  # or just reload with Mod+Ctrl+r"
