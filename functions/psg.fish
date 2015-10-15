function psg
  ps axu | grep $argv | grep -v grep
end
