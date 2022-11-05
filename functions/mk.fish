function mk --argument-names process
  set handled_process (echo (string split -m 1 '' $process) | awk '{ print "\["$1"\]"$2 }')

  ps -ax | grep $handled_process | awk '{ print $1 }' | xargs kill -9
end
