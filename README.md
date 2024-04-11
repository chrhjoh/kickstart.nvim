# DotFiles

This repository contains my dotfiles for configuration of:

* Terminal: Kitty
* Shell: [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) ([oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/) and [oh-my-posh](https://ohmyposh.dev/docs))
* Window Manager: [Tmux](https://github.com/tmux/tmux)
* Editor: [Neovim](https://github.com/neovim/neovim)

## Requirements
The programs above will have to be installed manually. Installations can be found from the link above. 

## Installation 
The files can be cloned to the 

on Linux and Mac
```sh
git clone https://github.com/chrhjoh/dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/dotfiles
```
After cloning the dotfiles can be linked to either `$XDG_CONFIG_HOME` or `$HOME` (See `bin/make_links.sh`) by the following command.
Remember to back up current configurations that you want to save.

```sh
cd ${XDG_CONFIG_HOME:-$HOME/.config}"/dotfiles && bash bin/make_links.sh
```
