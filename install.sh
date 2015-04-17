#!/bin/bash

PAIR_USERNAME=${PAIR_USERNAME:-"pair"}
PAIR_FULL_NAME=${PAIR_FULL_NAME:-"Garry Pair"}
PAIR_GROUP=${PAIR_GROUP:-"pair"}
CURRENT_USERNAME=`whoami`

echo "Installing github-auth..."
bundle install --binstubs

echo "\n\nCreating the user ${PAIR_USERNAME}..."
sudo dscl . -append /Users/${PAIR_USERNAME} RecordName '$PAIR_FULL_NAME' $PAIR_USERNAME
sudo mkdir -p /Users/pair/.ssh
sudo chown -R pair /Users/pair

echo "\n\nCreating the group ${PAIR_GROUP}"
sudo dscl . create /Groups/pair
sudo dscl . create /Groups/pair RealName "pair"
sudo dscl . create /Groups/pair passwd "*"
sudo dscl . create /Groups/pair gid 400
sudo dscl . create /Groups/pair GroupMembership ${PAIR_USERNAME}
sudo dscl . append /Groups/pair GroupMembership ${CURRENT_USERNAME}

sudo chgrp -R pair /Users/pair/.ssh

echo "Updating sshd_config..."
sudo sed -E -i.bak 's/^#?(PasswordAuthentication|ChallengeResponseAuthentication).*$/\1 no/' /etc/sshd_config

