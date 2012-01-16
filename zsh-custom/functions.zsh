function c { cd ~/code/$1; }  # cd into ~/code

function h { cd ~/$1; }       # cd into ~

# View a file with bcat and pygments
function pview {
  if [ ! $# -eq 2 ]; then
    echo "Usage: pview <file> <lexer>"
    return
  fi

  pygmentize -Ofull,style=colorful,linenos=1, -f html -l $2 $1 | bcat
}

# Quick backup a file
function bak {
  if [ ! $# -eq 1 ]; then
    echo "Usage: bak <file>"
    return
  elif [ ! -f $1 ]; then
    echo "$1 is not a file."
    return
  fi

  cp $1{,.bak}
}

# Git add all changes, commit.
function gac {
  if [ ! $# -eq 1 ]; then
    echo "Usage: gac <commit message>"
    return
  fi

  git add -A
  git commit -m $1
}

# Git add all changes, commit with a message, push to origin/master.
function gacp {
  Usage="Usage: gacm <commit message> <remote:origin> <remote branch:master>"

  if [ $# -eq 0 ]; then
    echo $Usage
    return
  elif [ $# -eq 2 ]; then
    echo $Usage
    return
  elif [ $# -gt 3 ]; then
    echo $Usage
    return
  fi

  PushRemote="origin"
  PushBranch="master"

  if [ $2 ]; then
    PushRemote=$2
    PushBranch=$3
  fi

  git add -A
  git commit -m $1
  git push $PushRemote $PushBranch
}
