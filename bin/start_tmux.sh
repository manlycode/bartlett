#!/bin/bash

tmux start-server
tmux new-session -d -s pair
tmux send-keys -t pair "tmux choose-session" C-m
tmux attach-session -t pair
