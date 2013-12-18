set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/heroku/bin $PATH
set -x PATH /usr/local/share/npm/bin $PATH

set -U EDITOR vim
set RUBY_GC_MALLOC_LIMIT 60000000
set RUBY_FREE_MIN 200000

#aliases
alias rake='bundle exec rake'
alias spec='bundle exec spec'
alias rspec='bundle exec rspec'
alias brails='bundle exec rails'
alias clear_drive='rm -rf .fseventsd ._.Trashes .Trashes .Spotlight-V100'
