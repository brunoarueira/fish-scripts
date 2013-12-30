function extract
  if set -q argv
    if test -f $argv
      switch $argv
        case *.tar.bz2
          tar -jxvf $argv
        case *.tar.gz
          tar -zxvf $argv
        case *.bz2
          bunzip2 $argv
        case *.dmg
          hdiutil mount $argv
        case *.gz
          gunzip $argv
        case *.tar
          tar -xvf $argv
        case *.tbz2
          tar -jxvf $argv
        case *.tgz
          tar -zxvf $argv
        case *.zip
          unzip $argv
        case *.Z
          uncompress $argv
        case '*'
          echo "'$argv' cannot be extracted/mounted via extract"
      end
    else
      echo "'$argv' is not a valid file"
    end
  end
end
