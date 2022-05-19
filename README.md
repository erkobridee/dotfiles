# dotfiles

> Working on it

repository to configure macOS dev machine

## Installation

### Remote

via curl:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/erkobridee/dotfiles/master/setup_remote.sh)"
```

or wget:

```sh
sh -c "$(wget -qO- https://raw.githubusercontent.com/erkobridee/dotfiles/master/setup_remote.sh)"
```

### Manual

clone:

```sh
git clone https://github.com/erkobridee/dotfiles ~/.dotfiles
```

#### setup all

> executes the full machine setup, defined on [`setup/_run`](setup/_run)

```sh
cd ~/.dotfiles
sh setup.sh
```

#### setup system terminal tools

> executes the system (terminal related stuff) setup<br/>
> loads the ~/.dotfiles/system_load.sh into the ~/.zshrc file<br/>
> defined on [`setup/system.sh`](setup/system.sh)

```sh
cd ~/.dotfiles
sh setup.sh system
```

## Documentation

- [dotfiles](docs/dotfiles.md)

- [ShellScript](docs/shellscript.md)

- [macOS](docs/macos.md)

## Inspirations

- [[GitHub] webpro/dotfiles](https://github.com/webpro/dotfiles)

- [[GitHub] holman/dotfiles](https://github.com/holman/dotfiles)

- [[GitHub] camspiers/dotfiles](https://github.com/camspiers/dotfiles)

- [[GitHub] mzdr/macOS](https://github.com/mzdr/macOS) - 💻 When I do a clean macOS installation.

## Known issues

### Dockutils

The instalation over homebrew installs the version 2.0.5 which doesn't work with the latest Mac OS v12

- [[GitHub] kcrawford/dockutil - #127](https://github.com/kcrawford/dockutil/issues/127) - Not working on macOS 12.3 - need to upgrade Homebrew version from 2 to 3

Temporary solution: ([comment](https://github.com/kcrawford/dockutil/issues/127#issuecomment-1118733013))

```
brew install --cask hpedrorodrigues/tools/dockutil
```
