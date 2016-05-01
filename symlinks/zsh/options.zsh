# Do not record an event that was just recorded again
setopt hist_ignore_dups

# Delete an old recorded event if a new event is a duplicate
setopt hist_ignore_all_dups
setopt hist_save_nodups

# Expire a duplicate event first when trimming history
setopt hist_expire_dups_first

# Do not display a previously found event
setopt hist_find_no_dups

# Share history
setopt share_history

# Pack extra blank
setopt hist_reduce_blanks

# Write to the history file immediately, not when the shell exits
setopt inc_append_history

# Remove comannd of 'hostory' or 'fc -l' from history list
setopt hist_no_store

# Remove functions from history list
setopt hist_no_functions

# Record start and end time to history file
setopt extended_history

# Ignore the beginning space command to history file
setopt hist_ignore_space

# Append to history file
setopt append_history

# Edit history file during call history before executing
setopt hist_verify

# Enable history system like a Bash
setopt bang_hist

# Expand parameters and substitude commands in prompts
setopt prompt_subst
