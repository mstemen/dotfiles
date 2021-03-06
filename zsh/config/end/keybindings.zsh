#!/usr/local/bin/bash

# Keybindings set up for applications. Eventually will be organized.

# ..........eventually.

# we're going to add vim stuff here because it's needed for keybindings

# source $ZDOTDIR/config/begin/vim.zsh

bindkey -s '^o' 'r\n'  # runs the 'r' command with 'ranger'
bindkey -s '^F' 'zi\n' # runs "zoxide" in interactive mode
bindkey -s '^G' 'cd **\t'
bindkey '^T' fzf-completion
bindkey '^R' fzf-history-widget
bindkey -M vicmd 's' vi-easy-motion
