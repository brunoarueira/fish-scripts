function mk --argument-names program
  ps -ax | grep $program | grep -v 'tty' | ag '^[0-9]+' -o | xargs kill -9 $1
end
