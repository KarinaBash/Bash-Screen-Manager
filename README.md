# Bash Screen Manager

**Bash Screen Manager** is a simple tool that allows you to easily manage and control `screen` sessions through a user-friendly interface.

## Features

- Display a list of active `screen` sessions.
- Open a selected `screen` session.
- Kill (terminate) a selected `screen` session.

## Prerequisites

Make sure you have `screen` installed on your system. If not, you can install it with.

```bash
sudo apt-get install screen   # For Debian/Ubuntu
sudo yum install screen       # For CentOS/RHEL
``` 
## Installation
To install the script globally on your system, run the following command.
```
sudo curl -o /usr/local/bin/screen-manager https://raw.githubusercontent.com/KarinaBash/Bash-Screen-Manager/master/screen-manager.sh && sudo chmod +x /usr/local/bin/screen-manager
```

## Usage 
Once installed, you can run the script using the following command.
```
screen-manager
```

This will present a menu with the following options.

1. Open Screen: Choose this option to open a specific screen session from the active list.
2. Kill Screen: Choose this option to kill (terminate) a specific screen session.
3. Exit: Quit the script.

## Logging
All activities performed by the script are logged in a file located at
- $HOME/screen_manager.log
