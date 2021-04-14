# Ruby
alias rake='bundle exec rake'
alias spec='bundle exec spec'
alias rspec='bundle exec rspec'
alias brails='bundle exec rails'

# Others
alias clear_drive='rm -rf .fseventsd ._.Trashes .Trashes .Spotlight-V100'
# alias top="top -o cpu"
alias ssh "env TERM=xterm-256color ssh"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder"

# docker
alias dk="docker kill (docker ps -q -a)"
alias dvr="docker volume rm"

# docker-compose
alias dce="docker-compose exec"
alias dcu="docker-compose up"
alias dck="docker-compose kill"
alias dcrm="docker-compose rm"
alias dcr="docker-compose run"
alias dcps="docker-compose ps"
alias dcl="docker-compose logs"
alias dcrt="docker-compose restart"
