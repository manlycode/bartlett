#!/bin/bash

source ./env.sh

echo "Removing the user ${PAIR_USERNAME}..."
sudo dscl . delete /Users/${PAIR_USERNAME:?"Please set PAIR_USERNAME before continuing"}

echo "Removing the directory ${PAIR_HOME}..."
sudo rm -rf ${PAIR_HOME:?"Please set PAIR_HOME"}


echo "Removing tmux socket directory /var/tmp/tmux..."
rm -rf /var/tmp/tmux
