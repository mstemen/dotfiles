# ALIASES

# UTILITIES; SHORTENED {{{
alias c='clear && ll'                 # clear terminal display, show directory
alias cat='bat --theme="ansi-dark"'   # because bat is just insanely better than cat
alias cls='clear'                     # clear sisplay, just like `mongo` shell
alias count='tokei'                   # use this to count the amount of files in a given directory
alias cp='cp -iv'                     # preferred 'cp' implementation
alias diff='delta'                    # use delta as your differ of choice
alias du='du -hs * | sort -hr | less' # preferred way of using the "du" command, mostly for reference
alias dud='du -d 1 -h'                # get size of all directories in current directory, including self
alias duf='du -sh *'                  # get size of all files in currect directory, exclusing self, including directories
alias edit='vim'                      # default editor if i don't want to leave the terminal
alias f='open -a Forklift .'          # opens current directory in Forklift
alias ff='fzf'                        # shortening fzf
alias grep='grep --color'             # always colorize output
alias kill='fkill'                    # a better process killer
alias mv='mv -iv'                     # preferred 'mv' implementation
alias r='ranger-cd'                   # mapped to the ranger function that cd's the appropriate directory when you quit
alias rg='rg -ziN'                    # always ignore line numbers, search compressed files, case-insensitivity
alias rm='rm -i'                      # makes sure 'rm' always requires confirmation
alias rm='trash -v'                   # a better rm
alias t='tail -f'                     # shorten tail, and always continue to tail unless cancelled
alias things='things.sh'              # shortening things script
alias tldr='tldr -t base16'           # preferred tldr theme
alias top='glances'                   # better resource visualizer
alias touch='ad'                      # advance_touch, a better newfile implementation. See: https://github.com/tanrax/terminal-AdvancedNewFile#-advanced-new-file-
alias v='nvim'                        # shortening usage of nvim
alias vs='code'                       # shortening vscode's code
alias zr='zrun'                       # making zrun a bit more easy to run
alias zz='_z -c 2>&1'                 # idk what this does
alias hdi='howdoi -c -n 3'            # howdoi plugin to search for code completion stuff
# }}}

# KUBECTL/KUBECTX/KUBENS ALIASES {{{
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
alias kx='kubectx'
alias kns='kubens'
# }}}

# GIT ALIASES {{{
eval "$(hub alias -s)"         # hub = git; hub is a superset of git, so everything should work
alias gst='tig status'         # better way to view git status
alias gclean='git-clean-local' # cleans out any branches from local that have been deleted on remote
alias sm="smerge"
# }}}

# LS/TREE IMPROVEMENTS (aka -> lsd) {{{
# alias ls='lsd --group-dirs first'                    # substituting regular ls with exa
# alias l='ls -l'                                      # preferred use of l
# alias ll='ls -la --blocks permission,size,date,name' # preferred use of ll
# alias lr='ls -laR'                                   # recursive preferred use
# alias tree='ls --tree'
# }}}

# EXA/TREE IMPROVEMENTS (aka -> exa) {{{
alias ls='exa -F --group-directories-first --icons'
alias l='ls -l'
alias lg='ls -la --git --color-scale'
alias ll='ls -la --color-scale'
alias tree='ls --tree'
# }}}

# CD ALIASES {{{
alias cdlogs="cd $HOME/Downloads/logs && cd"
alias cdtyp="cd $HOME/GitLocal/Work/Typinator && cd"
alias cdatlas="cd $HOME/MongoDB/_AtlasPlayground"
alias cddot="cd $HOME/GitLocal/Play/dotfiles"
alias cdwork="cd $HOME/GitLocal/Work && cd"
alias cdplay="cd $HOME/GitLocal/Play && cd"
alias cdgit="cd $HOME/GitLocal && cd"
alias cddown="cd $HOME/Downloads && cd"
alias cdmms="cd /mms"

# cd up directories
alias cdd='cd ..'             # cd back 1 directory
alias cdd='cd ../..'          # cd back 2 directories
alias cdd='cd ../../..'       # cd back 3 directories
alias cdd='cd ../../../..'    # cd back 4 directories
alias cdd='cd ../../../../..' # cd back 5 directories
# }}}

# VS CODE ALIASES {{{
alias zshrc='code ~/.zshrc' # Quick access to the ~/.zshrc file
alias dotfiles="code $HOME/GitLocal/Play/dotfiles"
# }}}

# MONITORING {{{
#   memHogsTop, memHogsPs:  find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  find CPU hogs
#   -----------------------------------------------------
alias cpuhogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'
# }}}

# FIND ALIASES {{{
alias flatten='find . -mindepth 2 -type f -print0 | xargs -0 -I {} mv --backup=numbered {} .'
# }}}
