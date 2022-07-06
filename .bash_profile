source ~/.bashrc

# https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

NVIM_BIN="/Users/trongbq/workspace/tools/nvim-osx64/bin"
CARGO_BIN="$HOME/.cargo/bin"
GO_BIN="$HOME/go/bin"
export PATH="$NVIM_BIN:$CARGO_BIN:$GO_BIN:$PATH"
