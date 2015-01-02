set fish_greeting ""

# Choose the last version postgres installed by Postgres.app
set postgresapp_base_path /Applications/Postgres.app/Contents/Versions

function choose_pg_version
  ls $postgresapp_base_path | sort -k 2 -nr | head -n 1
end

set -q PG_VERSION; or set PG_VERSION (choose_pg_version)

### PATH ###
set postgresapp $postgresapp_base_path/$PG_VERSION/bin
set homebrew /usr/local/bin /usr/local/sbin
set heroku /usr/local/heroku/bin
set npm /usr/local/share/npm/bin
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set default_path /usr/bin /usr/sbin /bin /sbin
set -gx PATH $postgresapp $homebrew $heroku $npm $rbenv_bin $rbenv_shims $default_path

### Ruby (rbenv) ###
rbenv rehash >/dev/null ^&1

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
