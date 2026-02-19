#!/usr/bin/env bash
# Daily backups of ~/Developer and ~/Documents (meant to be triggered by SleepWatcher on wake).
# - Creates timestamped .tar.gz archives in a Drive-synced folder
# - Excludes large, safe-to-regenerate folders from Developer (including .git)
# - Keeps last N backups for each prefix
# - Runs at most once per day (stamp file)

set -euo pipefail
IFS=$'\n\t'
umask 077

BACKUP_DIR="$HOME/Library/CloudStorage/GoogleDrive-ayan.yenb@gmail.com/My Drive/Backups"
KEEP_DEVELOPER=7
KEEP_DOCUMENTS=30

STAMP="$HOME/.backup_last_run_day"
TODAY="$(date +%Y-%m-%d)"

# Run only once per day (good for wake-based triggers)
if [[ -f "$STAMP" && "$(cat "$STAMP")" == "$TODAY" ]]; then
  exit 0
fi

DATE="$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

backup_tar_gz() {
  # Usage: backup_tar_gz <Prefix> <FolderUnderHome> [tar options...]
  local prefix="$1"
  local folder="$2"
  shift 2

  local out="$BACKUP_DIR/${prefix}_${DATE}.tar.gz"
  local tmp="$out.partial"

  # If we exit early, remove partial file
  trap 'rm -f -- "$tmp"' RETURN

  echo "Creating $out"

  tar -cf - -C "$HOME" "$@" "$folder" | gzip > "$tmp"
  gzip -t "$tmp"
  mv -f -- "$tmp" "$out"

  trap - RETURN
}

prune_keep_last() {
  # Usage: prune_keep_last <Prefix> <HowManyToKeep>
  local prefix="$1"
  local keep="$2"
  local n=0

  # Sort newest-first by filename timestamp (YYYYMMDD_HHMMSS sorts correctly)
  find "$BACKUP_DIR" -maxdepth 1 -type f -name "${prefix}_*.tar.gz" -print \
    | LC_ALL=C sort -r \
    | while IFS= read -r f; do
        n=$((n + 1))
        if (( n > keep )); then
          echo "Deleting $f"
          rm -f -- "$f"
        fi
      done
}

# Developer
backup_tar_gz Developer Developer \
  --exclude='Developer/*/.git' \
  --exclude='Developer/*/.git/*' \
  --exclude='Developer/*/node_modules' \
  --exclude='Developer/*/node_modules/*' \
  --exclude='Developer/*/dist' \
  --exclude='Developer/*/dist/*' \
  --exclude='Developer/*/build' \
  --exclude='Developer/*/build/*' \
  --exclude='Developer/*/.next' \
  --exclude='Developer/*/.next/*' \
  --exclude='Developer/*/.cache' \
  --exclude='Developer/*/.cache/*'

# Documents
backup_tar_gz Documents Documents

# Retention
prune_keep_last Developer "$KEEP_DEVELOPER"
prune_keep_last Documents "$KEEP_DOCUMENTS"

# Mark success for today (so wake-trigger won't repeat)
echo "$TODAY" > "$STAMP"

echo "Done."
