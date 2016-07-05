function last_modified -d 'Shows the last modified file/path on the current folder'
  ls -lth | sed 1d | head -1
end
