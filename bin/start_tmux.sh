# Start Tmux and show select menu
$(which tmux) -S /var/tmp/tmux/pair new-session -d -s choose-menu
$(which tmux) -S /var/tmp/tmux/pair send-keys -t choose-menu "\$(which tmux) choose-session" C-m
$(which tmux) -S /var/tmp/tmux/pair attach-session -t choose-menu
