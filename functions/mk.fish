function mk --argument-names process
  ps ax | grep $process | grep -v grep | grep -E '^[0-9]+\s' -o | xargs kill -9
end
