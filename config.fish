stty -echo

set fish_greeting ""

set -gx LC_TIME 'pt_BR.UTF-8'
set -gx LC_MESSAGES 'en_US.UTF-8'

### Go ###
set -gx GOPATH /Users/bruno_arueira/trabalho/go

# Choose the last version postgres installed by Postgres.app
set postgresapp_base_path /Applications/Postgres.app/Contents/Versions

function choose_pg_version
  ls $postgresapp_base_path | sort -k 2 -nr | head -n 1
end

set -q PG_VERSION; or set PG_VERSION (choose_pg_version)

# Sets java home
set JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands"

# Android
set -gx ANDROID_HOME /usr/local/opt/android-sdk

### PATH ###
set postgresapp $postgresapp_base_path/$PG_VERSION/bin
set homebrew /usr/local/bin /usr/local/sbin
set heroku /usr/local/heroku/bin
set npm /usr/local/share/npm/bin
set node_modules /usr/local/lib/node_modules
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set gopathbin $GOPATH/bin
set default_path /usr/bin /usr/sbin /bin /sbin
set -gx PATH $postgresapp $homebrew $heroku $npm $node_modules $rbenv_bin $rbenv_shims $gopathbin $default_path

### Ruby (rbenv) ###
rbenv rehash >/dev/null ^&1

### Rbenv ###
status --is-interactive; and . (rbenv init -|psub)

# Default editor
set -U EDITOR vim

# Ruby env vars
set RUBY_GC_MALLOC_LIMIT 4000100
set RUBY_GC_MALLOC_LIMIT_MAX 16000100
set RUBY_GC_HEAP_GROWTH_FACTOR 1.1
set RUBY_GC_OLDMALLOC_LIMIT 16000100
set RUBY_GC_OLDMALLOC_LIMIT_MAX 16000100

. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/utils.fish"

stty echo
