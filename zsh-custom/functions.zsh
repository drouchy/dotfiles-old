function c { cd ~/code/$1; }  # cd into ~/code

function h { cd ~/$1; }       # cd into ~

# Git add all changes, commit with a message, push to origin/master.
function gacm {
  git add -A
  git commit -m $1
  git push origin master
}
