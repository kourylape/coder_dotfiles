# Disable the fish greeting message
set fish_greeting ""

# Set environment variables
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x PROMPT_TOOLKIT_COLOR_DEPTH DEPTH_24_BIT
set -x BAT_THEME "rose-pine"

# Add to the $PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.asdf/shims
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin

# History configuration
set -g fish_history fish
set -g fish_history_control ignoredups:erasedups
set -U fish_history_save_not_valid false
set -g history_max_size 50000

# Easy reload by calling fish
function fish
  source ~/.config/fish/config.fish
end
