function csv-show
  column -s';' -t < $argv | less -#2 -N -S
end
