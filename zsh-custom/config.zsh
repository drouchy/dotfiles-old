# OS X Lion: Use GCC for C compiler.
export CC=/usr/bin/gcc-4.2

export PS1="\W $ "
export EDITOR="mvim -f"

export PATH=/usr/local/rvm/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
