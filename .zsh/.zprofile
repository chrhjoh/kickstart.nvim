# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
# Initialize oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.json)"

export EDITOR="nvim"
export DOCKER_CONFIG="$HOME/.config/docker"

export DOTBARE_DIR="$HOME/.local/share/dotfiles/"
export DOTBARE_TREE=$HOME
alias gitdot="/usr/bin/git --git-dir=$DOTBARE_DIR --work-tree=$DOTBARE_TREE"


alias python=python3
alias vi=nvim
alias vim=nvim
alias e=nvim

