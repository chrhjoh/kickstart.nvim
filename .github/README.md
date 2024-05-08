# DotFiles

This repository contains my dotfiles for configuration of:

* Terminal: [Wezterm](https://github.com/wez/wezterm)
* Command Prompt: [oh-my-posh](https://ohmyposh.dev/docs)
* Window Manager: [Tmux](https://github.com/tmux/tmux)
* Editor: [Neovim](https://github.com/neovim/neovim)
* Shell: zsh ([oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh))

## Installation 
I manage my dotfiles with a bare git repository. That means the files can be cloned directly.
After installing yadm, this repository can be cloned by running:
```sh
git clone --bare git@github.com:chrhjoh/dotfiles.git $HOME/.dot
git --git-dir=$HOME/.dot --work-tree=$HOME checkout
```
In cases where this fails because of present files, they can be moved by running the following commands.

```sh
mkdir -p .config-backup && \
git --git-dir=$HOME/.dot --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
This backs up any config files that would be overwritten and then you can rerun the checkout command from above.

A bootstrapping script is supplied for installing various applications on macOS using brew and the Brewfile in this repository. This has not been tested on any other OS and will likely not work. This script will also download homebrew if it is not present currently.
Bootstrapping can be done by:

```sh
~/.bin/bootstrap.sh
```

## Usage
An alias is created to interact with the created git repo. This can be used to add, commit, revert etc as needed.
As an example:
```sh
.git status
```
