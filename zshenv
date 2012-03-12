# RVM for Vim
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export EDITOR=vim
export PATH=~/Developer/scripts:/opt/local/bin:/opt/local/sbin:$PATH
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color ?"
export shell=/usr/local/bin/zsh
export PATH=/usr/local/bin:$PATH

alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
