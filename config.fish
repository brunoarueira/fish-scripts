set fish_greeting ""

### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set heroku /usr/local/heroku/bin
set npm /usr/local/share/npm/bin
set brew_rbenv "~/.rbenv/shims"
set -gx PATH $homebrew $heroku $npm $brew_rbenv $default_path

### Ruby (rbenv) ###
. (rbenv init -)

# Default editor
set -U EDITOR vim

# Ruby env vars
set RUBY_GC_MALLOC_LIMIT 60000000
set RUBY_FREE_MIN 200000

#aliases
alias rake='bundle exec rake'
alias spec='bundle exec spec'
alias rspec='bundle exec rspec'
alias brails='bundle exec rails'
alias clear_drive='rm -rf .fseventsd ._.Trashes .Trashes .Spotlight-V100'
