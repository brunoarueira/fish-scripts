# Environment Variables

# Locale settings
set -gx LC_TIME 'pt_BR.UTF-8'
set -gx LC_MESSAGES 'en_US.UTF-8'
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# OS detection (used by other conf.d files)
set -x current_os (uname -s)

# Android
if test $current_os = "Linux"
  set -gx ANDROID_HOME /usr/lib/android-sdk
else
  set -gx ANDROID_HOME ~/Library/Android/sdk
  set -gx ANDROID_SDK_HOME ~/Library/Android/sdk
  set -gx ANDROID_NDK_HOME /opt/homebrew/share/android-ndk
end

# Sets java home (currently commented out)
# set -gx JAVA_HOME "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands"

# PKG_CONFIG_PATH
if test $current_os = "Linux"
  set -gx PKG_CONFIG_PATH /usr/share/pkgconfig,/usr/lib/pkgconfig,/usr/lib/x86_64-linux-gnu/pkgconfig
else
  set -gx PKG_CONFIG_PATH /opt/homebrew/opt/libpq/lib/pkgconfig,/opt/homebrew/lib/pkgconfig
end

# Go paths
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin

# GPG TTY
set -gx GPG_TTY (tty)

# Default editor
set -U EDITOR nvim

