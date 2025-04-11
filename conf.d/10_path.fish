# PATH Configuration

# Define path components
set local_bin $HOME/.local/bin
set cargo_env $HOME/.cargo/env
set cargo_bin $HOME/.cargo/bin
set homebrew /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/bin
set node_modules /usr/local/lib/node_modules
set rbenv_bin $HOME/.rbenv/bin
set rbenv_shims $HOME/.rbenv/shims
set default_path /usr/bin /opt/homebrew/bin /usr/sbin /bin /sbin /usr/local/bin
set android_emulator $ANDROID_HOME/emulator # Depends on ANDROID_HOME from 00_env_vars.fish
set android_platform_tools $ANDROID_HOME/platform-tools # Depends on ANDROID_HOME
set android_tools $ANDROID_HOME/tools # Depends on ANDROID_HOME
set fastlane $HOME/.fastlane/bin
set qt $HOME/Qt5.5.0/5.5/clang_64/bin
set libpq /opt/homebrew/opt/libpq/bin
set gnubin /opt/homebrew/opt/inetutils/libexec/gnubin
set openssl /opt/homebrew/opt/openssl@1.1/bin
# FIXME: The ghostscript bins below is temporary
set ghostscript $HOME/Downloads/ghostscript-9.26/bin
set llvm /opt/homebrew/opt/llvm/bin

# Linux specific paths
set linuxbrew ''
if test $current_os = "Linux" # Depends on current_os from 00_env_vars.fish
  set linuxbrew /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
end

# Set the final PATH, prepending our custom paths
# Order matters: earlier entries have higher priority
set -gx PATH $local_bin $ghostscript $llvm $homebrew $qt $openssl $gnubin $libpq $default_path $node_modules $rbenv_bin $rbenv_shims $android_emulator $android_tools $android_platform_tools $fastlane $cargo_env $cargo_bin $GOPATH $GOBIN $linuxbrew

