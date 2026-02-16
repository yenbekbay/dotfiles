#!/usr/bin/env bash
# Simple backups of ~/Developer and ~/Documents with retention.
# - Creates timestamped .tar.gz archives in a Drive-synced folder
# - Excludes only the biggest, safe-to-regenerate junk from Developer
# - Keeps last N backups per folder

set -euo pipefail
IFS=$'\n\t'
umask 077

BACKUP_DIR="$HOME/Library/CloudStorage/GoogleDrive-ayan.yenb@gmail.com/My Drive/Backups"
DATE="$(date +%Y%m%d_%H%M%S)"

KEEP_DEVELOPER=7
KEEP_DOCUMENTS=30

mkdir -p "$BACKUP_DIR"

compress_tar() {
  # Usage: compress_tar <Name> <FolderInsideHome>
  local name="$1"
  local folder="$2"
  local out="$BACKUP_DIR/${name}_${DATE}.tar.gz"
  local tmp="$out.partial"

  echo "Creating $out"

  tar -cf - -C "$HOME" "$folder" \
    | pv \
    | pigz > "$tmp"

  pigz -t "$tmp"
  mv -f "$tmp" "$out"
}

compress_developer() {
  local out="$BACKUP_DIR/Developer_${DATE}.tar.gz"
  local tmp="$out.partial"

  echo "Creating $out"

  tar -cf - -C "$HOME" \
    --exclude='*/.git' \
    --exclude='*/.git/*' \
    --exclude='*/node_modules' \
    --exclude='*/node_modules/*' \
    --exclude='*/dist' \
    --exclude='*/dist/*' \
    --exclude='*/build' \
    --exclude='*/build/*' \
    --exclude='*/.next' \
    --exclude='*/.next/*' \
    --exclude='*/.cache' \
    --exclude='*/.cache/*' \
    Developer \
    | pv \
    | pigz > "$tmp"

  pigz -t "$tmp"
  mv -f "$tmp" "$out"
}

prune_keep_last() {
  # Usage: prune_keep_last <Prefix> <HowManyToKeep>
  local prefix="$1"
  local keep="$2"

  # Newest first; keep first N, delete the rest
  ls -1t "$BACKUP_DIR/${prefix}_"*.tar.gz 2>/dev/null \
    | tail -n +"$((keep + 1))" \
    | while IFS= read -r f; do
        echo "Deleting $f"
        rm -f -- "$f"
      done
}

compress_developer
compress_tar Documents Documents

prune_keep_last Developer "$KEEP_DEVELOPER"
prune_keep_last Documents "$KEEP_DOCUMENTS"

echo "Done."
