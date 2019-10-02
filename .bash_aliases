alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias c='clear'
alias chist='history -c && history -w'
alias vi='vim'
alias open='xdg-open'
alias update='sudo apt update && sudo apt upgrade'
alias fixwifi='sudo service network-manager restart'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gc='git commit -m'
alias gg='cd $(git rev-parse --show-toplevel)'
alias ta='tmux attach -t '
alias xc='xcape -e '"'"'Control_L=Escape'"'"
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias :q='sl'



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
    n_dir=${HOME}; fi
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

function smash() {
  if [ ! -z "$1" ]; then
    gcc -m32 -static -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -o $1 $1.c
  else
    echo 'Usage: smash <exe>'
  fi
}
