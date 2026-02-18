if not set -q FISH_THEME
  set -g FISH_THEME "rose-pine"
end

# Path to themes directory
set -l theme_path "$HOME/.config/fish/themes/$FISH_THEME.fish"

# Check if the theme file exists and source it
if test -f $theme_path
    source $theme_path
else
  # Try to load it
  fish_config theme choose $FISH_THEME
end
