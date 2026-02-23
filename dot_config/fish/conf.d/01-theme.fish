if status is-interactive
  if not set -q FISH_THEME
    set -g FISH_THEME "rose-pine"
  end
  if test -f "$HOME/.config/fish/themes/$FISH_THEME.theme"
    fish_config theme choose $FISH_THEME
  end
end
