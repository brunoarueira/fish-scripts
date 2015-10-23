function __define_visibility -d 'Define the visibility based on parameters "on or off"'
  set -l visibility 0
  set -l toggle_parameter $argv[1]

  if test $toggle_parameter = "on"
    set visibility 1
  else if test $toggle_parameter = "off"
    set visibility 0
  end

  echo -e $visibility
end

function toggle -d 'Toggle the visibility of an application on OS X'
  set -l visibility 0

  if test (count $argv) = 2
    set visibility (__define_visibility $argv[2..-1])
  else if test (count $argv) = 1
    if test -n "$visibility"
      set visibility 0
    else
      set visibility 1
    end
  end

  osascript -e '
    on run args
      tell application "Finder"
        set visible of process (item 1 of args) to (item 2 of args)
      end tell
    end run
  ' $argv[1] $visibility
end
