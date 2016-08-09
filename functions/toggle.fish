function toggle --argument-names process visibility -d 'Toggle the visibility of an application on OS X'
  osascript -e '
    on run args
      set appName to (item 1 of args)
      set appVisibility to true

      tell application "System Events"
        set appVisibility to (get visible of process appName)
      end tell

      set appVisibility to not appVisibility

      tell application "Finder"
        set visible of process appName to appVisibility
      end tell
    end run
  ' $process
end
