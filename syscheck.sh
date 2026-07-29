#!/bin/bash
if [ "$1" == "--help" ]; then
  echo "Usage: bash syscheck.sh [OPTION]"
  echo ""
  echo "Options:"
  echo "  --help    Show this help message"
  echo "  (no option) Run full system check + backup"
  exit 0
fi


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

echo "----- Creating Backup -----"
backup_folder=~/projects/syscheck/backups
mkdir -p "$backup_folder"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
tar -czf "$backup_folder/backup_$timestamp.tar.gz" syscheck.sh
echo "Backup saved to: $backup_folder/backup_$timestamp.tar.gz"
