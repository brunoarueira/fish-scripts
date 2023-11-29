stty -echo

set fish_greeting ""

set -gx LC_TIME 'pt_BR.UTF-8'
set -gx LC_MESSAGES 'en_US.UTF-8'
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

set -x current_os (uname -s)

# Android
if test $current_os = "Linux"
  set -gx ANDROID_HOME /usr/lib/android-sdk
else
  set -gx ANDROID_HOME ~/Library/Android/sdk
  set -gx ANDROID_SDK_HOME ~/Library/Android/sdk
  set -gx ANDROID_NDK_HOME /usr/local/share/android-ndk
end

# Sets java home
# set -gx JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands"

if test $current_os = "Linux"
  set linuxbrew /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin

  set -gx PKG_CONFIG_PATH /usr/share/pkgconfig,/usr/lib/pkgconfig,/usr/lib/x86_64-linux-gnu/pkgconfig
else
  set linuxbrew ''

  set -gx PKG_CONFIG_PATH /usr/local/opt/libpq/lib/pkgconfig,/usr/local/lib/pkgconfig
end

### PATH ###
set cargo_env $HOME/.cargo/env
set cargo_bin $HOME/.cargo/bin
set homebrew /usr/local/bin /usr/local/sbin
set node_modules /usr/local/lib/node_modules
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set default_path /usr/bin /usr/local/bin /usr/sbin /bin /sbin
set android_emulator $ANDROID_HOME/emulator
set android_platform_tools $ANDROID_HOME/platform-tools
set android_tools $ANDROID_HOME/tools
set fastlane $HOME/.fastlane/bin
set qt $HOME/Qt5.5.0/5.5/clang_64/bin
set libpq /usr/local/opt/libpq/bin
set gnubin /usr/local/opt/inetutils/libexec/gnubin
set openssl /usr/local/opt/openssl@1.1/bin
# FIXME: The ghostscript bins below is temporary
set ghostscript $HOME/Downloads/ghostscript-9.26/bin
set llvm /usr/local/opt/llvm/bin
set -gx PATH $ghostscript $llvm $homebrew $qt $openssl $gnubin $libpq $default_path $node_modules $rbenv_bin $rbenv_shims $android_emulator $android_tools $android_platform_tools $fastlane $cargo_env $cargo_bin $linuxbrew

### Ruby (rbenv) ###
rbenv rehash >/dev/null 2>&1

### Rbenv ###
status --is-interactive; and source (rbenv init -|psub)

# Default editor
set -U EDITOR nvim

set -gx GPG_TTY (tty)

# fzf
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
--height=50% --min-height=15 --reverse
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#2E3440,hl+:#A3BE8C
--color pointer:#B48DAC,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#a3be8b
'
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

source "$HOME/.config/fish/functions/aliases.fish"
source "$HOME/.config/fish/functions/utils.fish"

source "$HOME/.config/fish/conf.d/fnm.fish"

stty echo
