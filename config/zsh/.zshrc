setopt HIST_SAVE_NO_DUPS  # Do not write dup event

# Initialize the completion
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/plugins/completion.zsh

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Aliases
source $CONFIG_HOME/aliases
