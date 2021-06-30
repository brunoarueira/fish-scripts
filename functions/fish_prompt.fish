function __parse_current_folder -d "Replace '/Users/$USER' by '~'"
  pwd | sed "s/^\/Users\/$USER/~/"
end

function __git_dirty_color
  set -x dirty_color (set_color green)
  set -l is_git_dirty (command git status --porcelain --ignore-submodules)

  if test -n "$is_git_dirty"
    set -x dirty_color (set_color red)
  end

  echo $dirty_color
end

function __parse_git_branch -d "Parse current Git branch name"
  set -l branch (git symbolic-ref HEAD | sed -e 's|^refs/heads/||')
  set -l revision (git rev-parse HEAD | cut -b 1-7)

  if test (count $branch) -gt 0
    echo (__git_dirty_color) $branch
  else
    echo (__git_dirty_color) $revision
  end
end

function __format_time -d "Format milliseconds to a human readable format" --argument-names miliseconds
  set -l seconds (math "$miliseconds / 1000 % 60")
  set -l minutes (math "$miliseconds / 60000 % 60")
  set -l hours (math "$miliseconds / 3600000 % 24")
  set -l days (math "$miliseconds / 86400000")
  set -l time ""
  set -l threshold 5

  if test $days -gt 0
    set time (command printf "$time%sd " $days)
  end

  if test $hours -gt 0
    set time (command printf "$time%sh " $hours)
  end

  if test $minutes -gt 0
    set time (command printf "$time%sm " $minutes)
  end

  if test $seconds -gt $threshold
    set time (command printf "$time%ss" $seconds)
  end

  echo -e $time
end

function __get_ruby_version
  set -l ruby_version (ruby --version | cut -d' ' -f2)

  if test (count $ruby_version) -gt 0
    echo $ruby_version
  else
    echo "(ruby version not installed)"
  end
end

function fish_prompt
  set -l exit_code $status

  # Symbols
  set -l symbol_prompt "❯"
  set -l symbol_git_down_arrow "⇣"
  set -l symbol_git_up_arrow "⇡"

  # Colors
  set -l color_blue (set_color blue)
  set -l color_green (set_color green)
  set -l color_normal (set_color normal)
  set -l color_purple (set_color purple)
  set -l color_red (set_color red)
  set -l color_yellow (set_color yellow)

  # Template
  set -l current_folder (__parse_current_folder)
  set -l command_duration ""
  set -l prompt ""
  set -l git_arrows

  # Format current folder on prompt output
  set prompt $prompt "\n$color_green $color_blue$current_folder$color_normal "

  # Handle previous command exit code
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $color_red

    # Prompt failed command execution duration
    set command_duration (__format_time $CMD_DURATION)

    set prompt $prompt "$color_yellow$command_duration$color_normal "
  end

  # Exit with code 1 if git is not available
  if not command -s git >/dev/null
    return 1
  end

  # Check if is on a Git repository
  set is_git_repository (command git rev-parse --is-inside-work-tree >/dev/null 2>&1)
  set is_git_repository_status $status

  set prompt $prompt "$color_purple$current_version$color_normal"

  if test $is_git_repository_status -eq 0
    set git_branch_name (__parse_git_branch)

    # Check if there is an upstream configured
    set -l has_upstream (command git rev-parse --abbrev-ref @'{u}')

    if test -n "$has_upstream"
      set -l git_status (command git rev-list --left-right --count HEAD...@'{u}' | sed 's/[[:blank:]]/|/')

      # Resolve Git arrows by treating `git_status` as an array
      set -l git_arrow_left (command echo $git_status | cut -f 1 -d "|")
      set -l git_arrow_right (command echo $git_status | cut -f 2 -d "|")

      # If arrow is not "0", it means it's dirty
      if test $git_arrow_left -ne 0
        set git_arrows $symbol_git_up_arrow
      end

      if test $git_arrow_right -ne 0
        set git_arrows $git_arrows$symbol_git_down_arrow
      end
    end

    # Format Git prompt output
    set prompt $prompt "$color_gray$git_branch_name$color_normal\t$color_cyan$git_arrows$color_normal"
  end

  set prompt $prompt "\n$color_symbol$symbol_prompt$color_normal "

  echo -e -s $prompt
end

# Set title to current folder and shell name
function fish_title
  echo (__parse_current_folder) – $_
end

# Removes right prompt
function fish_right_prompt
end
