# NJ Laptop Setup

This project automates the process of setting up a new NJ laptop. This is based on and inspired by similar scripts at [18F](https://github.com/18F/laptop), [Pivotal](https://github.com/pivotal/workstation-setup), and [Thoughtbot](https://github.com/thoughtbot/laptop). These are written to be run on a Mac.

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

Additionally, when the script is run, all customizations will be prompted via a yes/no input, allowing the user to opt-in to each of these customizations.

## Details

This installs the following

### Shared
- Homebrew
- Applications & Utilities:
  - [Rectangle](https://rectangleapp.com/) window manager
  - [Postman](https://www.postman.com/)
  - [iTerm2](https://iterm2.com/)
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Firefox](https://www.firefox.com/)
  - [Macdown](https://macdown.uranusjr.com/)
  - [wget](https://www.gnu.org/software/wget/)
- Languages and tools
  - Node via [nvm](https://github.com/nvm-sh/nvm)
  - Ruby via [rbenv](https://github.com/rbenv/rbenv)
  - [Postgres](https://www.postgresql.org/)
  - Python tools [coming soon]
  - Docker [coming soon]
 
### Customizations
- [Oh My Zsh](https://ohmyz.sh/)
  - custom zsh theme config
  - custom zsh git prompt config
- Mac config
  - Autohide the dock
  - Set text repeat speed
  - Set finder path display
  - Remove default icons from dock; add apps instead
- Git Aliases

  - [Docker](https://www.docker.com/)

## Additional actions

In order to push to GitHub repos using SSH, you will need to:
- [Generate an SSH key and add it to ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Add the SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## VSCode setup

We have some recommended settings for VSCode that are commonly used on teams:
- TO FILL IN

## Contributing

Any contributions are welcome via pull request. Some ways to contribute might be:
- Add to the customization options! Include your own zsh theme or any other quality-of-life tools and config that other developers might benefit from
- Change or add to the shared setup. This might require more thorough review to confirm that the shared choices are what we want to commit to orienting towards as an office, but opening a suggestion via PR is the best way to start that process
- Refactor the existing bash scripting process to make it more readable and maintainable
