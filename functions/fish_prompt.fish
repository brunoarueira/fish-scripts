set fish_git_dirty_color red

function parse_git_branch
  set -l branch (git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /')

  echo (set_color $fish_git_dirty_color)$branch(set_color red)
end

function get_ruby_version
  echo (ruby --version | cut -d' ' -f2)
end

function fish_prompt
  printf '%s%s %s[%s]%s %s%s %s%s$ ' (set_color green) (whoami) (set_color blue) (prompt_pwd) (set_color purple) (get_ruby_version) (set_color red) (parse_git_branch) (set_color normal)
end
