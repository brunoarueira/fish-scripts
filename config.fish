stty -echo

set fish_greeting ""

set -gx LC_TIME 'pt_BR.UTF-8'
set -gx LC_MESSAGES 'en_US.UTF-8'

### Go ###
set -gx GOPATH /Users/bruno_arueira/trabalho/go

# Sets java home
set JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands"

# Android
set -gx ANDROID_HOME ~/Library/Android/sdk

### PATH ###
set homebrew /usr/local/bin /usr/local/sbin
set heroku /usr/local/heroku/bin
set npm /usr/local/share/npm/bin
set node_modules /usr/local/lib/node_modules
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set gopathbin $GOPATH/bin
set default_path /usr/bin /usr/sbin /bin /sbin
set -gx PATH $homebrew $heroku $npm $node_modules $rbenv_bin $rbenv_shims $gopathbin $default_path

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

if not begin
    # Is the agent running already? Does the agent-info file exist, and if so,
    # is there a process with the pid given in the file?
    [ -f ~/.gpg-agent-info ]
    and kill -0 (cut -d : -f 2 ~/.gpg-agent-info) ^/dev/null
  end

  # no, it is not running. Start it!
  gpg-agent --daemon --no-grab --write-env-file ~/.gpg-agent-info >/dev/null ^&1
end

# get the agent info from the info file, and export it so GPG can see it.
set -gx GPG_AGENT_INFO (cut -c 16- ~/.gpg-agent-info)
set -gx GPG_TTY (tty)

# docker/dinghy
set -gx DOCKER_HOST tcp://192.168.64.3:2376
set -gx DOCKER_CERT_PATH ~/.docker/machine/machines/dinghy
set -gx DOCKER_TLS_VERIFY 1
set -gx DOCKER_MACHINE_NAME dinghy

. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/utils.fish"

# Direnv
eval (direnv hook fish)

stty echo
