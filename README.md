# syscheck

A lightweight Bash CLI tool for system monitoring and automated backups - built while learning Linux/Bash scripting.

## Features
- Displays current date, time, and working directory
- Lists files in the current folder
- Shows disk usage
- Warns if disk usage is 80% or higher (shown in color)
- Creates timestamped, compressed backups
- Logs every run with timestamps to log.txt
- Supports --info-only and --backup-only modes
- Handles errors gracefully (e.g. failed backup folder creation)

## Example Output
----- Current Date & Time -----
Thu Jul 30 18:48:52 IST 2026
----- Disk Usage -----
Filesystem Size Used Avail Use% Mounted on
C:/Program Files/Git 475G 189G 286G 40% /
----- Disk Space Check -----
Disk usage is at 40% - looking fine.
----- Creating Backup -----
Backup saved to: backups/backup_2026-07-30_18-48-56.tar.gz

## How to Run
```bash
git clone https://github.com/sinchanas034/syscheck.git
cd syscheck
bash syscheck.sh
```

## Usage Options
```bash
bash syscheck.sh                # Run full check + backup
bash syscheck.sh --info-only    # Show system info only
bash syscheck.sh --backup-only  # Run backup only
bash syscheck.sh --help         # Show usage instructions
```

## Requirements
- Bash (Linux, macOS, or Git Bash on Windows)

## Why I Built This
I'm learning Linux and Bash scripting, and wanted a small real project instead of just tutorials. This tool taught me file permissions, conditionals, error handling, logging, command-line arguments, colored output, and Git/GitHub workflows.

## Roadmap
- [x] Basic system info
- [x] Backup automation
- [x] --help flag
- [x] Disk space warning
- [x] Error handling
- [x] Logging
- [x] --info-only / --backup-only modes
- [x] Colored terminal output
- [ ] Backup rotation (auto-delete old backups)
- [ ] Configurable backup target folder

## License
MIT
