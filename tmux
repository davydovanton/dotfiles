##########################
# Plugins
###########################
#
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'tmux-plugins/tmux-battery'


##########################
# General
###########################

set-option -g set-titles on

set-option -g default-command "reattach-to-user-namespace -l $SHELL"

# start window index of 1
set-option -g base-index 1
setw -g pane-base-index 1

# vim-tmux-navigator plugin
# Smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys C-l) || tmux select-pane -R"
# bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|nvim|vim?)(diff)?$' && tmux send-keys 'C-\\') || tmux select-pane -l"

# UTF-8
#set-option -g status-utf8 on

# supposedly fixes pausing in vim
set-option -sg escape-time 1

# Mouse
# ====
# Make mouse useful in copy mode
set -g mouse on
# Scroll History
set -g history-limit 30000
# Set ability to capture on start and restore on exit window data when running an application
setw -g alternate-screen on
# Lower escape timing from 500ms to 50ms for quicker response to scroll-buffer access.
set -s escape-time 50
# ====

# vi
# ====
setw -g mode-keys vi
set -g status-keys vi

# setup 'v' to begin selection as in vim
bind-key -T copy-mode-vi v send-keys -X begin-selection

# update default binding of `Enter` to also use copy-pipe (os x)
unbind-key -T copy-mode-vi Enter
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

# map vi movement keys as pane movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# use vi left and right to cycle thru panes
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# resize panes using vi keys
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
# ====

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
#set-option -g bell-on-alert off
set-option -g bell-action none
set-option -g visual-bell off
set-option -g visual-activity off
#set-option -g visual-content off 
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
#set -g status-utf8 on

# set refresh interval for status bar
set -g status-interval 30

# show session, window, pane in left status bar
set -g status-left-length 30
set -g status-left '#S #I:#P'

# https://github.com/tmux-plugins/tmux-online-status#configure-icons 
set -g status-interval 30
set -g @online_icon "on"
set -g @offline_icon "off"
 
# show hostname, date, time, and battery in right status bar
# set-option -g status-right '#(/usr/local/bin/battery -t) | %H:%M %d/%m/%y#(/usr/local/bin/online-status -t)'
set-option -g status-right '#{battery_icon} #{battery_percentage} | %H:%M %d/%m/%y#(/usr/local/bin/online-status -t)'
set -g status-right-length 30
 
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
set-option -g status-bg colour235
set-option -g status-fg colour245

set-option -g message-bg colour235
set-option -g message-fg white

# highlight current window
set-window-option  -g window-status-current-fg black
set-window-option  -g window-status-current-bg blue

set-window-option -g window-status-fg white 
set-window-option -g window-status-bg colour235

# set color of active pane
set -g pane-border-fg colour236
set -g pane-border-bg black
set -g pane-active-border-fg blue
set -g pane-active-border-bg black
