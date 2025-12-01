# NJ Laptop Setup

This project automates the process of setting up a new NJ laptop. This is based on and inspired by similar scripts at [18F](https://github.com/18F/laptop), [Pivotal](https://github.com/pivotal/workstation-setup), and [Thoughtbot](https://github.com/thoughtbot/laptop).

## Getting Started

Open Terminal and run the following commands.

**NOTE**: If this is your first time using git on your machine, then MacOS will prompt you to download and install command line developer tools. Click "Install" on the popup to proceed.

```sh
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/newjersey/nj-laptop-setup.git
cd workstation-setup
./setup.sh
```

## Opinionated vs Custom

This script is fairly opinionated by default, so that developers who don't want to do much custom work can have a sensible setup out-of-the-box. Developers who care more about a custom workflow can feel free to make changes to the setup script before running. That said, some of the development setup components are intentionally meant to be consistent across machines and projects. 

To this end, the project is divided into two folders: 
- `/shared` scripts are meant to consistent and to be run unedited to avoid custom tooling setups. 
- `/customizations` is meant to be a baseline sensible setup. Anything in here is fair game to add, change, or remove before running it on your machine, if you prefer other options.

## Details

This installs the following

### Shared
- Homebrew
- Applications:
  - Rectangle window manager
  - Postman
  - ITerm2
  - Visual Studio Code
  - Firefox
  - Macdown
- Unix
  - wget
- Languages and tools
  - Node via nvm
  - Ruby via rbenv
  - Postgres
  - Python tools [coming soon]
  - Docker [coming soon]
 
### Customizations
- Oh-My-Zsh
  - zsh theme config
  - zsh git prompt config
- Mac config
  - Autohide the dock
  - Set text repeat speed
  - Set finder path display
  - Remove default icons from dock; add apps instead
- Git Aliases


