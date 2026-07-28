#!/bin/bash
echo "----- Current Date & Time -----"
date

echo "----- Current Folder -----"
pwd

echo "----- Files in this folder -----"
ls -la

echo "----- Disk Usage -----"
df -h 2>/dev/null || echo "df not fully supported in Git Bash — showing folder size instead:"
du -sh ~ 2>/dev/null

echo "----- Creating Backup -----"
backup_folder=~/projects/syscheck/backups
mkdir -p "$backup_folder"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
tar -czf "$backup_folder/backup_$timestamp.tar.gz" syscheck.sh
echo "Backup saved to: $backup_folder/backup_$timestamp.tar.gz"
