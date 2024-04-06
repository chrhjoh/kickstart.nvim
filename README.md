# Neovim

## Installation
Clone kickstart.nvim:

on Linux and Mac
```sh
git clone https://github.com/chrhjoh/neovim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```
on Windows (cmd)
```sh
git clone  https://github.com/chrhjoh/neovim.git  %userprofile%\AppData\Local\nvim\ 
```
on Windows (powershell)

```sh
git clone https://github.com/chrhjoh/neovim.git $env:USERPROFILE\AppData\Local\nvim\ 
```

## Start Neovim

```sh
nvim
```

The `Lazy` plugin manager will start automatically on the first run and install the configured plugins - as can be seen in the introduction video. After the installation is complete you can press `q` to close the `Lazy` UI and **you are ready to go**! Next time you run nvim `Lazy` will no longer show up.

If you would prefer to hide this step and run the plugin sync from the command line, you can use:

```sh
nvim --headless "+Lazy! sync" +qa
```


