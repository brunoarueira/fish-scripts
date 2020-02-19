# Ruby
alias rake='bundle exec rake'
alias spec='bundle exec spec'
alias rspec='bundle exec rspec'
alias brails='bundle exec rails'

# Others
alias clear_drive='rm -rf .fseventsd ._.Trashes .Trashes .Spotlight-V100'
alias top="top -o cpu"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder"

alias dk="docker kill (docker ps -q -a)"
alias dcr="docker-compose run"
alias dvr="docker volume rm"
