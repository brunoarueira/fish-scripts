stty -echo

set fish_greeting ""

set -gx LC_TIME 'pt_BR.UTF-8'
set -gx LC_MESSAGES 'en_US.UTF-8'
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Android
set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx ANDROID_SDK_HOME ~/Library/Android/sdk
set -gx ANDROID_NDK_HOME /usr/local/share/android-ndk

### PATH ###
set homebrew /usr/local/bin /usr/local/sbin
set node_modules /usr/local/lib/node_modules
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set default_path /usr/bin /usr/sbin /bin /sbin
set android_emulator $ANDROID_HOME/emulator
set android_platform_tools $ANDROID_HOME/platform-tools
set fastlane $HOME/.fastlane/bin
set stack_bins $HOME/.local/bin
set -gx PATH $homebrew $default_path $node_modules $rbenv_bin $rbenv_shims $android_emulator $android_platform_tools $fastlane $stack_bins

### Ruby (rbenv) ###
rbenv rehash >/dev/null 2>&1

### Rbenv ###
status --is-interactive; and source (rbenv init -|psub)

# Default editor
set -U EDITOR nvim

# Ruby env vars
set RUBY_GC_MALLOC_LIMIT 4000100
set RUBY_GC_MALLOC_LIMIT_MAX 16000100
set RUBY_GC_HEAP_GROWTH_FACTOR 1.1
set RUBY_GC_OLDMALLOC_LIMIT 16000100
set RUBY_GC_OLDMALLOC_LIMIT_MAX 16000100

# PKG-CONFIG
set PKG_CONFIG_PATH /usr/local/lib/pkgconfig

if not begin
    # Is the agent running already? Does the agent-info file exist, and if so,
    # is there a process with the pid given in the file?
    [ -f ~/.gpg-agent-info ]
    and kill -0 (cut -d : -f 2 ~/.gpg-agent-info) ^/dev/null
  end

  # no, it is not running. Start it!
  gpg-agent --daemon --no-grab --write-env-file ~/.gpg-agent-info >/dev/null 2>&1
end

# get the agent info from the info file, and export it so GPG can see it.
set -gx GPG_AGENT_INFO (cut -c 16- ~/.gpg-agent-info)
set -gx GPG_TTY (tty)

# fzf
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

source "$HOME/.config/fish/functions/aliases.fish"
source "$HOME/.config/fish/functions/utils.fish"

### NVM ###
set -gx NVM_DIR /usr/local/opt/nvm

bass source $NVM_DIR/nvm.sh --no-use

# Direnv
eval (direnv hook fish)

# startship
starship init fish | source

stty echo
