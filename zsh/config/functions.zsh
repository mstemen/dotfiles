# FUNCTIONS

ranger-cd() {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
      cd -- "$(cat "$tempfile")"
    fi
  rm -f -- "$tempfile"
}

gevg() {
  printf "%s - %s (%s commit(s))" \
    "$(git branch --show-current)" \
    "$(git log -1 --pretty=%B)" \
    "$(git rev-list --count trunk..)"
}

mcd() { # mcd: Makes new Dir and jumps inside
  mkdir -p "$1" && cd "$1"
}
myip() { # myip: prints out your current IP
  echo "My WAN/Public IP address: $(dig +short myip.opendns.com @resolver1.opendns.com)"
}

pretty_csv() { # pretty_csv: prettify CSV files
  column -t -s "$@" | less -F -S -X -K
}

co() { # run vs code without the dumb ass flickering
  code "$@" --disable-gpu --ignore-gpu-blacklist
}

grepip() { # grep unique IPs from within a log file
  \grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$@" | sort | uniq
}

conditional_fd() {
  if [[ $PWD == $HOME ]]; then
    fd -paiHL -t d -d 2
  else
    fd -paiHL -t d
  fi
}

my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command; } # my_ps: List processes owned by my user:

ii() { #   ii:  display useful host related informaton
  echo -e "\nYou are logged on $HOST"
  echo -e "\nAdditionnal information: "
  uname -a
  echo -e "\nUsers logged on: "
  w -h
  echo -e "\nCurrent date :$NC "
  date
  echo -e "\nMachine stats :$NC "
  uptime
  echo -e "\nCurrent network location :$NC "
  scselect
  echo -e "\n"
  myip
  #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

backup-now() { # backup things
  cd $DOTFILES_HOME/setup
  ./plzlog info "Backing up files to: $DOTFILES_HOME/backup (run the command again if it fails!)"
  (
    cd $DOTFILES_HOME/backup

    (cd $DOTFILES_HOME/setup && ./plzlog info "Backing up Homebrew packages...")
    rm Brew*
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump

    (cd $DOTFILES_HOME/setup && ./plzlog ok "Brewfile successfully regenerated." && ./plzlog info "Backing up global NPM packages...")
    backup-global backup -o npm.global.backup.txt

    (cd $DOTFILES_HOME/setup && ./plzlog ok "NPM Backup successfully regenerated." && ./plzlog info "Backing up VSCode extension list...")
    code --list-extensions >vscode-extensions-backup.txt

    (cd $DOTFILES_HOME/setup && ./plzlog ok "VSCode extension list successfully regenerated.")
  )
  ./plzlog ok "Backup complete!"
  ./plzlog info "The following files were backed up:
    $DOTFILES_HOME/backup/Brewfile
    $DOTFILES_HOME/backup/npm.global.backup.txt
    $DOTFILES_HOME/backup/vscode-extensions-backup.txt"
}

# directory color rendering
eval $(gdircolors $HOME/.dircolors/dircolors.ansi-universal)

# open current branch in jira
jbr() {
  open "https://jira.mongodb.com/browse/$(git branch --show-current)"
}

# pipe cht.sh output to "cat" (which in turn calls "bat") to make the output a little easier to digestd, especially when the output goes off-screen
ch() {
  cht.sh "$@" | cat
}
