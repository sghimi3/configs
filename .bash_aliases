alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias c='clear'
alias chist='history -c && history -w'
alias vi='vim'
alias csc='ssh cs310229@classes.csc.lsu.edu'
alias op='gnome-open'
alias update='sudo apt update && sudo apt upgrade'
alias fixwifi='sudo service network-manager restart'
alias cp='cp -i'
alias mv='mv -i'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias xc='xcape -e '"'"'Control_L=Escape'"'"
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

function go() {
  if [ -z "$1" ]; then
    echo "Usage: go [server_name]"
  else
    case "$1" in
      wiki)   ssh -p 2525 sghimire@wiki.cct.lsu.edu   ;;
      scribe) ssh -p 2525 sghimire@scribe.cct.lsu.edu ;;
      vault)  ssh -p 2525 sghimire@vault.cct.lsu.edu  ;;
      bounce) ssh -p 2525 sghimire@bounce.cct.lsu.edu ;;
      db)     ssh -p 2525 sghimire@db.cct.lsu.edu     ;;
      steam)  ssh -p 2525 sghimi3@steam.cct.lsu.edu   ;;
      whaley) ssh cs350115@classes.csc.lsu.edu        ;;
      sql)    ssh cs440214@classes.csc.lsu.edu        ;;
      *)      echo "$1.cct.lsu.edu not found!"        ;;
    esac
  fi
}

function ga() {
  if [ -z "$1" ]; then
    git add -A
  else
    git add "$@"
  fi
}

# Change directory and ls automatically
function cd() {
  n_dir="$*"
  if [ $# -eq 0 ]; then
    n_dir=${HOME}
  fi
  builtin cd "${n_dir}" && ls
}

# Compile 32-bit executable in C
function run32() {
  if [ ! -z "$1" ]; then
    gcc -g $1.c -o $1 -lpthread -lrt -lm -fopenmp -m32 && ./$1
  else
    echo 'Usage: run [executable]'
  fi
}

function remindme() {
  echo "mutt email@hostname.com -a File1 File2 -s \"Subject\" <<< \"Body\""
  echo "tar cvvzf dir-name.tgz dir-name/"
}
