alias gpr="git pull --rebase"
compdef gpr=git

alias ggpr="git pull --rebase origin $(current_branch)"
compdef ggpr=git

alias amend="git commit --amend" 
compdef amend=git

alias gr2="git rebase -i HEAD~2"
compdef gr2=git

alias gr3="git rebase -i HEAD~3"
compdef gr3=git
