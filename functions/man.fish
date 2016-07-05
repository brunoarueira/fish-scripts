function man
  setenv -x LESS_TERMCAP_mb (set_color -o red)
  setenv -x LESS_TERMCAP_md (set_color -o red)
  setenv -x LESS_TERMCAP_me (set_color normal)
  setenv -x LESS_TERMCAP_se (set_color normal)
  setenv -x LESS_TERMCAP_so (set_color -b blue -o yellow)
  setenv -x LESS_TERMCAP_ue (set_color normal)
  setenv -x LESS_TERMCAP_us (set_color -o green)
  command man $argv;
end
