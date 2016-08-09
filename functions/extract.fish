function extract --argument-names file
  if set -q file
    if test -f $file
      switch $file
        case *.tar.bz2
          tar -jxvf $file
        case *.tar.gz
          tar -zxvf $file
        case *.bz2
          bunzip2 $file
        case *.dmg
          hdiutil mount $file
        case *.gz
          gunzip $file
        case *.tar
          tar -xvf $file
        case *.tbz2
          tar -jxvf $file
        case *.tgz
          tar -zxvf $file
        case *.zip
          unzip $file
        case *.Z
          uncompress $file
        case '*'
          echo "'$file' cannot be extracted/mounted via extract"
      end
    else
      echo "'$file' is not a valid file"
    end
  end
end
