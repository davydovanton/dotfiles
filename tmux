set-option -g default-command "reattach-to-user-namespace -l $SHELL"

# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

start window index of 1
set-option -g base-index 1
setw -g pane-base-index 1

# sane scrolling
# set-option -g terminal-overrides 'xterm*:smcup@:rmcup@'

# vim-tmux-navigator plugin
# Smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys 'C-\\') || tmux select-pane -l"

# UTF-8
set-option -g status-utf8 on

# supposedly fixes pausing in vim
set-option -sg escape-time 1

set-window-option -g mode-mouse on
set-option -g mouse-select-pane on
set-option -g mouse-resize-pane on
set-option -g mouse-select-window on

# act like vim
set-window-option -g mode-keys vi
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

# act like GNU screen
unbind C-b
set -g prefix C-a
# Allow C-A a to send C-A to application
bind C-a send-prefix
bind r source-file ~/.tmux.conf \; display-message "Config reloaded."

# Reload key
bind r source-file ~/.tmux.conf

# look good
set-option -g default-terminal "screen-256color-bce"
set -g history-limit 5000
setw -g xterm-keys on

# Rebinding the pane splitting bindings
# unbind % # Remove default bindings since we're replacing
bind | split-window -h
bind - split-window -v

# Open panes in new window
unbind v
unbind n
bind v send-keys " ~/tmux-panes -h" C-m
bind n send-keys " ~/tmux-panes -v" C-m

# Set window notifications
setw -g monitor-activity on
set -g visual-activity on

# disable bell
set-option -g bell-on-alert off
set-option -g bell-action none
set-option -g visual-bell off
set-option -g visual-activity off
set-option -g visual-content off 
# it's work!!! 
setw -g monitor-activity off
set -g visual-activity off

# panes

bind-key -r J resize-pane -D 5
bind-key -r K resize-pane -U 5
bind-key -r H resize-pane -L 5
bind-key -r L resize-pane -R 5

##########################
# Status Bar
###########################

# enable UTF-8 support in status bar
set -g status-utf8 on

# set refresh interval for status bar
set -g status-interval 30

# center the status bar
set -g status-justify left

# show session, window, pane in left status bar
set -g status-left-length 40
set -g status-left '#S #I:#P'

# https://github.com/tmux-plugins/tmux-online-status#configure-icons 
set -g status-interval 30
set -g @online_icon "on"
set -g @offline_icon "off"

# show hostname, date, time, and battery in right status bar
set-option -g status-right '#(/usr/local/bin/battery -t) | %H:%M %d/%m/%y#(/usr/local/bin/online-status -t)'

# wm window title string (uses statusbar variables)
set -g set-titles-string "tmux.#I.#W"
set-window-option -g automatic-rename off

# Refresh the status bar every 30 seconds.
set-option -g status-interval 30
set-option -g display-time 1000

# # The status bar itself.
set -g status-justify centre

###########################
# Colors
###########################

# color status bar
set -g status-bg colour235
set -g status-fg colour245

set -g message-bg colour235
set -g message-fg white

# highlight current window
setw -g window-status-current-fg black
setw -g window-status-current-bg blue

setw -g window-status-fg white 
setw -g window-status-bg colour235

# set color of active pane
set -g pane-border-fg colour235
set -g pane-border-bg black
set -g pane-active-border-fg blue
set -g pane-active-border-bg black
