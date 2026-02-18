function fish_prompt
  set -l last_status $status
  set -l pointer_color $fish_color_error
  test $status = 0; and set pointer_color $fish_color_operator

  if not set -q __fish_prompt_first_run
    set -g __fish_prompt_first_run 1
  else
    echo ""
  end

  # Current directory
  set_color -o $fish_color_command
  printf '%s' (prompt_pwd --dir-length=0)
  set_color normal

  # Get branch name and check if repository is dirty
  if command -q git; and git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l branch (git symbolic-ref --short HEAD 2>/dev/null; or git describe --tags --exact-match 2>/dev/null)

    if test -n "$branch"
      set_color "#545c7e"
      echo -n " ($branch) "

      if git diff --quiet --ignore-submodules HEAD 2>/dev/null
        set_color green
        echo -n "●"
      else
        set_color red
        echo -n "●"
      end
        set_color normal
      end
  end

  # linebreak
  echo ""

  # Line 2: Prompt
  set_color -o $pointer_color
  echo -n "❯ "
  set_color normal
end
