#!/bin/bash

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add all private keys in ~/.ssh starting with 'id_' to the SSH agent
for key in ~/.ssh/id_*; do
    if [[ -f "$key" && "$key" != *.pub && "$key" != *.config ]]; then
        chmod 600 "$key"
        ssh-add "$key"
    fi
done
