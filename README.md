# DotFiles

This repository contains my dotfiles for configuration of:

* Terminal: Kitty
* Command Prompt: [oh-my-posh](https://ohmyposh.dev/docs))
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

### oh-my-posh
The prompt theme can be added by adding it to your shell profile.

See [https://ohmyposh.dev/docs/installation/prompt] for information on how

The theme can be found at 
```sh
${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-posh/theme.json
```
