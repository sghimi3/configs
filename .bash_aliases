alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
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
alias gl='git log'
alias gd='git diff'
alias ga='git add -A'

function cd() {
  n_dir="$*"
  if [ $# -eq 0 ]; then
    n_dir=${HOME}
  fi
  builtin cd "${n_dir}" && ls
}

function run32() {
  if [ ! -z "$1" ]; then
    gcc -g $1.c -o $1 -lpthread -lrt -lm -fopenmp -m32 && ./$1
  else
    echo 'Usage: run [executable]'
  fi
}

function pdf() {
  if [ -z "$1" ]; then
    for file in $(ls *tex | sed 's/.tex//')
    do
      pdflatex $file.tex && rm $file.log $file.aux && evince $file.pdf
    done
  elif [[ "$1" == *tex ]]; then
    file=$(echo $1 | sed 's/.tex//')
    pdflatex $file.tex && rm $file.log $file.aux && evince $file.pdf
  else
    echo "LaTex file not found!"
    echo "Usage: pdf [file.tex]"
  fi
}

# mutt email@hostname.com -a File1 File2 -s "Subject" <<< "Body"
# tar cvvzf dir-name.tgz dir-name/
