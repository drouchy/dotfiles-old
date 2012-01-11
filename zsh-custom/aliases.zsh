# Directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

# Prettier, human-readable file lising.
alias l="ls -aFGhl"

# Various shortcuts
alias db="~/Dropbox"
alias v="vim"
alias m="mvim"

# Show/hide hidden Finder files
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# hub (Github + Git https://github.com/defunkt/hub)
alias git=hub

# git
alias gi="git init"
alias gs="git status"
alias ga="git add"
alias gps="git push"
alias gpm="git push origin master"
alias gpl="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gl="git log"

# Ruby on Rails
alias rs="rails server"
alias rc="rails console"
alias rg="rails generate"

# Alias commands with `bundle exec $command`
bundle_commands="rake rspec spec cucumber cap watchr rails rackup guard thin unicorn"

function run_bundler_cmd () {
  if [ -r ./Gemfile ]; then
    bundle exec $@
  else
    $@
  fi
}

for cmd in $bundle_commands; do
  alias $cmd="run_bundler_cmd $cmd"
done