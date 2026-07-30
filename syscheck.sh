#!/bin/bash
if [ "$1" == "--help" ]; then
  echo "Usage: bash syscheck.sh [OPTION]"
  echo ""
  echo "Options:"
  echo "  --help          Show this help message"
  echo "  --info-only     Show system info only, skip backup"
  echo "  --backup-only   Run backup only, skip system info"
  echo "  (no option)     Run full system check + backup"
  exit 0
fi

log_file=~/projects/syscheck/log.txt
echo "----------------------------------------" >> "$log_file"
echo "Run started: $(date)" >> "$log_file"

if [ "$1" != "--backup-only" ]; then
  echo "----- Current Date & Time -----"
  date

  echo "----- Current Folder -----"
  pwd

  echo "----- Files in this folder -----"
  ls -la

  echo "----- Disk Usage -----"
  df -h 2>/dev/null || echo "df not fully supported in Git Bash — showing folder size instead:"
  du -sh ~ 2>/dev/null

  echo "----- Disk Space Check -----"
  usage=$(df / | tail -1 | grep -oP '\d+(?=%)')
  if [ "$usage" -ge 80 ]; then
    echo "⚠️  WARNING: Disk usage is at ${usage}% — running low on space!"
  else
    echo "✅ Disk usage is at ${usage}% — looking fine."
  fi
fi

if [ "$1" != "--info-only" ]; then
  echo "----- Creating Backup -----"
  backup_folder=~/projects/syscheck/backups

  if ! mkdir -p "$backup_folder"; then
    echo "❌ ERROR: Could not create backup folder. Skipping backup."
    echo "ERROR: Could not create backup folder" >> "$log_file"
  else
    timestamp=$(date +%Y-%m-%d_%H-%M-%S)
    if tar -czf "$backup_folder/backup_$timestamp.tar.gz" syscheck.sh; then
      echo "✅ Backup saved to: $backup_folder/backup_$timestamp.tar.gz"
      echo "SUCCESS: Backup created - backup_$timestamp.tar.gz" >> "$log_file"
    else
      echo "❌ ERROR: Backup failed to create."
      echo "ERROR: Backup creation failed" >> "$log_file"
    fi
  fi
fi
