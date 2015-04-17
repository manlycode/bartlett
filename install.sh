PAIR_USERNAME=${PAIR_USERNAME:-"pair"}
PAIR_FULL_NAME=${PAIR_FULL_NAME:-"Garry Pair"}
PAIR_GROUP=${PAIR_GROUP:-"pair"}
CURRENT_USERNAME=`whoami`


echo "Installing github-auth..."
bundle install --binstubs

echo "\n\nCreating the group ${PAIR_GROUP}"
sudo dscl . -create /Groups/${PAIR_GROUP} RecordName "Pair"

echo "\n\nCreating the user ${PAIR_USERNAME}..."
sudo dscl . -append /Users/${PAIR_USERNAME} RecordName '$PAIR_FULL_NAME' $PAIR_USERNAME
sudo mkdir -p /Users/pair/.ssh
sudo chown -R pair /Users/pair

sudo dscl . append /Groups/${PAIR_GROUP} GroupMembership ${PAIR_USERNAME}
sudo dscl . append /Groups/${PAIR_GROUP} GroupMembership ${CURRENT_USERNAME}


echo "Updating sshd_config..."
sudo sed -E -i.bak 's/^#?(PasswordAuthentication|ChallengeResponseAuthentication).*$/\1 no/' /etc/sshd_config
