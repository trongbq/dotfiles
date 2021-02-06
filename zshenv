export CONFIG_HOME="$HOME/.config"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh
export ZDOTDIR="$CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Go
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"

# Rust
export CARGOBIN="$HOME/.cargo/bin"

# PATH
export PATH="$GOBIN:$PATH"
export PATH="$CARGOBIN:$PATH"
