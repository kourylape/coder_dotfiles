#!/usr/bin/env bash

# color scheme
# mode_prefix=
# mode_copy=
# mode_sync=
# mode_suspend=
# bg=
# active=
# subtle=

# variables
# icon=""
icon=""
larrow=""
rarrow=""
justify='centre'
position="bottom"

# prompt colors
default_color="#[fg=default bg=default]"
subtle_color="#[fg=${subtle}]"

# tmux mode prompts
active_color="#[fg=${mode_prefix}]$icon"
empty_color="#[fg=${subtle}]$icon"
copy_color="#[fg=${mode_copy}]$icon"
sync_color="#[fg=${mode_sync}]$icon"
suspend_color="#[fg=${mode_suspend}]$icon"

# old config
custom_prompt="#(tmux show-option -t #S -qv '@mode_indicator_custom_prompt')"
status_left="#{?#{!=:$custom_prompt,},$suspend_color,#{?client_prefix,${active_color},#{?pane_in_mode,$copy_color,#{?pane_synchronized,$sync_color,$empty_color}}}}"
status_right="#S #H"
status_right_extra="${subtle_color}$status_right "
status_left_extra=" $status_left #(tmux -V)${subtle_color}"
window_status_format=' #I:#W '

# Setting the options in tmux
set-option -g status-left-length 25
set-option -g status-position $position
set-option -g status-style bg=default,fg=$subtle
set-option -g status-justify "$justify"
set-option -g status-left "$status_left_extra"
set-option -g status-right "$status_right_extra"
set-option -g window-status-format "$window_status_format"
set-option -g window-status-current-format "#[fg=${active}]$larrow#[bg=${active},fg=${bg}]${window_status_format}#[fg=${active},bg=default]$rarrow"
