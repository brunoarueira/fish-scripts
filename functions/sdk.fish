set -gx SDKMAN_DIR "$HOME/.sdkman"

function sdk -d "Run sdkman"
  bash -c "source $HOME/.sdkman/bin/sdkman-init.sh; sdk $argv"
  sdkman-init
end

function sdkman-init -d "Inits sdkman"
  test -e $HOME/.sdkman/bin/sdkman-init.sh ||
    begin
      echo "You need to install sdkman" &&
      commandline -a "curl -s https://get.sdkman.io | bash" 2>/dev/null && return 1
    end

  set -gx PATH (bash -c "source $HOME/.sdkman/bin/sdkman-init.sh; echo \$PATH")
end
