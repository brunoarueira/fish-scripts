function csv-show --argument-names file separator
  if test -n "$separator"
    set -l separator ';'
  end

  column -s$separator -t < $file | less -#2 -N -S
end
