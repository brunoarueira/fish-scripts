function psg --argument-names process
  ps axu | grep $process | grep -v grep
end
