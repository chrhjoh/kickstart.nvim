# DotFiles

This repository contains my dotfiles for configuration of:

* Terminal: [Wezterm](https://github.com/wez/wezterm)
* Command Prompt: [oh-my-posh](https://ohmyposh.dev/docs)
* Window Manager: [Tmux](https://github.com/tmux/tmux)
* Editor: [Neovim](https://github.com/neovim/neovim)
* Shell: zsh ([oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh))

## Installation 
This repository is managed by yadm and needs to be installed before. instructions for installing yadm can be found [here](https://yadm.io/docs/install#).

After installing yadm, this repository can be cloned by running:
```sh
yadm clone https://github.com/chrhjoh/dotfiles.git
```
A bootstrapping script is supplied for installing various applications on macOS using brew and the Brewfile in this repository. This has not been tested on any other OS and will likely not work.
Bootstrapping can be done by:
```sh
yadm bootstrap
```
