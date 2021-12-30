[![Visits Badge](https://badges.pufler.dev/visits/cooperj/setup-windows10)](https://pufler.dev/git-badges/)

# Windows Setup Scripts

Collection of scripts to run on a new computer/clean install.

Each script can be ran Ad hoc, and some things wont get installed automatically this way.

## Warnings

- Ensure you save the Git repo to the `C:` Drive so the exact paths work, e.g. Settings for VS Code should be located at `C:\setup-windows10-main\VSCode\settings.json`

- If you are downloading as a ZIP from GitHub **make sure to manually download the [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater) submodule** and place the contents into the folder `Windows10Debloater`, you may also have to do this if you are running a `git clone` so check that the files are there before running script `1. Run Windows 10 Debloater`

## Scripts

- [x] 0. Run Windows 10 Debloater (Going to be trying [ShutUp10++](https://www.oo-software.com/en/shutup10) instead..)
- [x] 1. Install Chocolatey **(Required for Scripts 3 and 4)**
- [x] 2. Install Productivity Applications
- [x] 3. Install and Configure VS Code

## What is not included

- Install WSL2
- Install Docker
- Install Games
- Install Visual Studio (Full Edition)
- Install Unity
- Set Default Apps
- Install Office 365
- Install Adobe CC
- Login to Apps

### Tweaks not yet scripted
 - https://www.howtogeek.com/356087/how-to-automatically-enable-windows-10s-dark-theme-at-night/
