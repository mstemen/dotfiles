# PROFILING INFORMATION {{{
## Uncomment the following line (and last line) to get loading times for zshell
# zmodload zsh/zprof
# }}}

# LNAV {{{
# export LNAV_EXP="mouse"
# set LNAV_EXP="mouse"
# }}}

# JAVA MMS REQ {{{
# [ -s "/Users/juliant/.jabba/jabba.sh" ] && source "/Users/juliant/.jabba/jabba.sh"
# }}}

# ZSH SETTINGS {{{
POWERLEVEL9K_MODE='nerdfont-complete'
DEFAULT_USER="$(whoami)"
ZSH_THEME="powerlevel9k/powerlevel9k"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
BAT_THEME="base16"

setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt prompt_subst           # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt      # only show the rprompt on the current prompt
autoload colors
colors
# }}}

# PLUGINS & CACHE LOADING {{{
plugins=(git zsh-completions mongodb httpie npm node python alias-tips fast-syntax-highlighting zsh-autosuggestions)
## make zsh know about hosts already accessed
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

## for only occasional re-compilation
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit
else
    compinit -C
fi
# }}}

# SOURCE-ING {{{
## 'source'-ing oh-my-zsh.sh, so that things can work properly afterwards.
source ~/.dotfiles/oh-my-zsh/oh-my-zsh.sh

## sourcing external files
source ~/.zshsecrets/secrets.zsh                                # My secrets
source ~/.zsh/aliases.zsh                                       # aliases
source ~/.zsh/functions.zsh                                     # functions
source ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-autopair/autopair.zsh
source ~/.dotfiles/oh-my-zsh/custom/plugins/zsh-bd/bd.zsh
source ~/.dotfiles/oh-my-zsh/custom/plugins/enhancd/init.sh
export PATH="/usr/local/sbin:$PATH" # Because brew doctor complains

## Color needs to be set AFTER source-ing
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"
bindkey '^ ' autosuggest-accept # Binding `CTRL+SPACE` to auto-accept suggestions
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
# }}}

# INITIALIZING FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
--height 50% --reverse --border 
--preview '(bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -500'
--color dark,hl:33,hl+:#ef6e9c,fg+:235,bg+:#04a7fc,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
--bind tab:down --cycle
"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
# }}}

# POWERLINE SETTINGS {{{
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
# }}}

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# JABBA (for MMS) -> only turn on when you want to mess with MMS{{{
# [ -s "/Users/juliant/.jabba/jabba.sh" ] && source "/Users/juliant/.jabba/jabba.sh"
# export ANT_OPTS="-Xms64m -Xmx1500m"
# export ANT_HOME=/usr/local/apache-ant-1.10.5
# }}}

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

## THINGS NOT LOADING FAST ENOUGH? {{{
## comment out the following line (and the first line at the top of this file), start a new shell, analyze the results.
# zprof
# }}}
