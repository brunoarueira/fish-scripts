function is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function git_dirty_color
  set -x dirty_color (set_color green)

  if [ (is_git_dirty) ]
    set -x dirty_color (set_color red)
  end

  echo $dirty_color
end

function parse_git_branch
  set -l branch (git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /')

  echo (git_dirty_color) $branch
end

function get_ruby_version
  echo (ruby --version | cut -d' ' -f2)
end

function fish_prompt
  printf '%s%s %s %s%s %s%s$ ' (set_color green) (whoami) (set_color purple) (get_ruby_version) (parse_git_branch) (set_color normal)
end
