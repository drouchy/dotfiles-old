function c { cd ~/code/$1; }  # cd into ~/code

function h { cd ~/$1; }       # cd into ~

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
function gacm {
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
  git push origin master
}
